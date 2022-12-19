# Vim config

## Prerequisites
* https://github.com/junegunn/vim-plug installed
* `ag` (`the_silver_searcher`)
* `git`
* `nodejs`
* `yarn`

## Install
* Clone the repository to your vim config location. E. g.
``` bash
git clone git@github.com:Savolro/vim-config.git ~/.config/nvim 
```
* start vim
* run `:PlugUpdate`
* for Go:  `:CocInstall coc-go`
* for Rust:  `:CocInstall coc-rust-analyzer`

## Notes
this config has a builtin part for personal notes using gitjournal.io format. Currently it is
hardcoded to ~/dev/stuff/notes and expecting a git repository to exist there. Note that id does not
have any proper race checking. In case you have any git conflict, you'll have to solve it manually.
