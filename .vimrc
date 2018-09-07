set nocompatible
filetype off

" Vundle Plugin Manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" C Semantic Completion and Linter
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'

" Saving and Restoring Vim sessions
"Plugin 'tpope/vim-obsession'

" filesearch plugin
"Plugin 'kien/ctrlp.vim'

" undo tree traverse plugin
"Plugin 'sjl/gundo.vim'

" Seamless transition from vim to tmux panes
Plugin 'christoomey/vim-tmux-navigator'

" fancy-ass C/C++ helper functions
" Plugin 'LucHermitte/lh-vim-lib'
" Plugin 'LucHermitte/lh-tags'
" Plugin 'LucHermitte/lh-dev'
" Plugin 'LucHermitte/lh-brackets'
" Plugin 'LucHermitte/searchInRuntime'
" Plugin 'LucHermitte/mu-template'
" Plugin 'tomtom/stakeholders_vim'
" Plugin 'LucHermitte/alternate-lite'
" Plugin 'LucHermitte/lh-cpp'

call vundle#end()
filetype plugin indent on

syntax enable

set backspace=indent,eol,start

" Tab options
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Line number options
set number
set cursorline

" Misc Options
set wildmenu
set lazyredraw
set showmatch

" Search options
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Toggle paste mode
set pastetoggle=<leader>p

" YCM Config Options
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" vim-tmux navigator options
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>

" bracket completion
inoremap {<CR> {<CR>}<Esc>ko

" folding options
set foldenable
set foldlevelstart=10
set foldnestmax=10
" space folds and unfolds
nnoremap <space> za
set foldmethod=indent

" highlight last inserted text
nnoremap gV `[v`]

nnoremap <leader>u :GundoToggle<CR>

" move up and down lines visually
noremap j gj
noremap k gk

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" autorun language support stuff
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.c,*.h
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" backup swap files to tmp folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
