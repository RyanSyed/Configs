# Plugin Install Instructions
## To install Vundle
1. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## To install YouCompleteMe with semantic support for C-family languages:
1. sudo apt-get install build-essential cmake
2. sudo apt-get install python-dev python3-dev
3. Open vim, type :PluginInstall from command mode, wait for completion, then exit vim
4. cd ~/.vim/bundle/YouCompleteMe
5. ./install.py --clang-completer
6. Within your project, open vim and run :YcmGenerateConfig to read the makefile and configure You Complete Me

# Tmux setup instructions
1. git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
2. Tmux ressurect can get a bit annoying, if you want, remove the line at the bottom of .tmux.conf
3. If you're not using a laptop, you can remove the tmux-battery plugin and the corresponding entries in the 'set -g status-right' line
4. Run Tmux
5. Type Ctrl+a then shift+I

# How to use CtrlP
## Basic Usage
* Run `:CtrlP` or `:CtrlP [starting-directory]` to invoke CtrlP in find file mode.
* Run `:CtrlPBuffer` or `:CtrlPMRU` to invoke CtrlP in find buffer or find MRU file mode.
* Run `:CtrlPMixed` to search in Files, Buffers and MRU files at the same time.

Check `:help ctrlp-commands` and `:help ctrlp-extensions` for other commands.

##### Once CtrlP is open:
* Press `<F5>` to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
* Press `<c-f>` and `<c-b>` to cycle between modes.
* Press `<c-d>` to switch to filename only search instead of full path.
* Press `<c-r>` to switch to regexp mode.
* Use `<c-j>`, `<c-k>` or the arrow keys to navigate the result list.
* Use `<c-t>` or `<c-v>`, `<c-x>` to open the selected entry in a new tab or in a new split.
* Use `<c-n>`, `<c-p>` to select the next/previous string in the prompt's history.
* Use `<c-y>` to create a new file and its parent directories.
* Use `<c-z>` to mark/unmark multiple files and `<c-o>` to open them.

Run `:help ctrlp-mappings` or submit `?` in CtrlP for more mapping help.

* Submit two or more dots `..` to go up the directory tree by one or multiple levels.
* End the input string with a colon `:` followed by a command to execute it on the opening file(s):  
Use `:25` to jump to line 25.  
Use `:diffthis` when opening multiple files to run `:diffthis` on the first 4 files.
