-- Simple function to organize imports via LSP
local function organize_imports()
        -- Get the current buffer
        local bufnr = vim.api.nvim_get_current_buf()

        -- Get active clients for this buffer
        local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
        if #clients == 0 then
                -- No active clients, nothing to do
                return
        end

        -- Create the params with proper position encoding
        -- Use the newer function to create text document position params
        local params = {
                textDocument = vim.lsp.util.make_text_document_params(),
                context = { only = { "source.organizeImports" } },
        }

        -- Try to use LSP to organize imports
        for _, client in ipairs(clients) do
                -- Only request from clients that support the capability
                if client.supports_method("textDocument/codeAction") then
                        client.request("textDocument/codeAction", params, function(err, actions, _)
                                if err then
                                        return
                                end
                                if not actions or vim.tbl_isempty(actions) then
                                        return
                                end

                                for _, action in ipairs(actions) do
                                        -- Check if this is an organize imports action
                                        if
                                                action.kind and action.kind:find("source.organizeImports")
                                                or action.title and action.title:find("Organize Imports")
                                        then
                                                -- If the action has edits, apply them
                                                if action.edit then
                                                        vim.lsp.util.apply_workspace_edit(
                                                                action.edit,
                                                                client.offset_encoding
                                                        )
                                                -- If the action has a command, execute it
                                                elseif action.command then
                                                        local command = type(action.command) == "table"
                                                                        and action.command
                                                                or action
                                                        vim.lsp.buf.execute_command(command)
                                                end
                                                return
                                        end
                                end
                        end, bufnr)
                end
        end
end

-- Create autocmd group
local augroup = vim.api.nvim_create_augroup("AutoImports", { clear = true })

-- Set up auto-imports on save for common filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        pattern = { "*.go", "*.py", "*.js", "*.ts", "*.jsx", "*.tsx", "*.java", "*.scala" },
        callback = function()
                organize_imports()
        end,
})

-- Create a manual command to organize imports
vim.api.nvim_create_user_command("OrganizeImports", function()
        organize_imports()
        vim.notify("Imports organized", vim.log.levels.INFO)
end, {})

-- Return module in case we want to use it elsewhere
return { organize_imports = organize_imports }
