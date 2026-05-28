" Comments in Vimscript start with a `"`.
" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
let mapleader=";"

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
"
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set noexpandtab
set term=screen-256color
set encoding=utf-8
set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set history=5000
set wildmenu
set wildmode=longest:list,full

nnoremap <C-Tab> :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>

" semicolon end of a line
" nnoremap ;; A;<Esc>
inoremap ;; <C-o>A;
"--------------------------------------------------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source 
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

Plug 'https://github.com/easymotion/vim-easymotion.git'

Plug 'preservim/nerdtree'

Plug 'liuchengxu/vista.vim'
" Plug 'mileszs/ack.vim'

Plug 'flazz/vim-colorschemes'

Plug 'dense-analysis/ale'

Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'voldikss/vim-translator'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer',  'for': ['c', 'cpp', 'python', 'sh', 'zsh']  }

Plug 'mattn/emmet-vim'

Plug 'alvan/vim-closetag'

Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'

Plug 'preservim/vim-markdown'

" Initialize plugin system
call plug#end()

"auto-pairs
execute "set <M-B>=\eB"
"execute "set <M-e>=\ee"
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-B>'

"fzf
function! RgVisualSelection()
    " 保存当前寄存器和光标位置
    let l:save_reg = @"
    let l:save_cursor = getpos(".")

    " 获取可视区域文本
    normal! gv"xy
    let l:selection = @x

    " 恢复寄存器和光标位置
    let @" = l:save_reg
    call setpos('.', l:save_cursor)

    " 执行 :Rg 命令
    execute 'Rg' l:selection
endfunction


nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
vnoremap <silent> <Leader>f :<C-u>call RgVisualSelection()<CR>


"easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
nmap gl <Plug>(easymotion-lineforward)
nmap gh <Plug>(easymotion-linebackward)
nmap gf <Plug>(easymotion-overwin-f2)

"CtrlP
"CtrlPlet g:ctrlp_cmd = 'ff'

"color theam
colorscheme candy

" airline
let laststatus = 2
let g:airline_theme='badwolf'
let g:airline_experimental = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enable = 1

" vim-translator
" Echo translation in the cmdline
" nmap <silent> <Leader>t <Plug>Translate
" vmap <silent> <Leader>t <Plug>TranslateV
""" Display translation in a window
nmap <silent> <C-t> <Plug>TranslateW
"vnoremap <C-i>    :echoe "Use k"<CR>
vmap <silent> <C-t> <Plug>TranslateWV
" vmap <silent> <Leader>w <Plug>TranslateWV
" Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR
" vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX
"vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascriptreact': 'jsxRegion',
\ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
"
" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"YCM
let g:ycm_semantic_triggers = {
		\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
		\ 'cs,lua,javascript,html': ['re!\w{2}'],
		\ }
"let g:ycm_confirm_extra_conf=0
"
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
set completeopt=longest,menu
let g:ycm_seed_indentifiers_with_synatx=1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
" -----------------------------------------------------------------------------
"  html
autocmd FileType xml,html inoremap </ </<C-x><C-o>

" ALE
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_set_highlights = 0
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_statusline_format = ['x %d', '! %d', 'y OK']
nmap <Leader>ap <Plug>(ale_previous_wrap)
nmap <Leader>an <Plug>(ale_next_wrap)
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ad :ALEDetail<CR>
let g:ale_linters = {
			\ 'c++': ['clang'],
			\ 'c': ['clang'],
			\ 'python': ['pylint'],
			\ }

" polyglot
let g:polyglot_disabled = ['markdown']


""""""""""""""""""""""""""""""""""""""" vim-markdown
" Enable folding.
let g:vim_markdown_folding_disabled = 0

" Fold heading in with the contents.
let g:vim_markdown_folding_style_pythonic = 1

" Don't use the shipped key bindings.
let g:vim_markdown_no_default_key_mappings = 1

" Autoshrink TOCs.
let g:vim_markdown_toc_autofit = 1

" Indentation for new lists. We don't insert bullets as it doesn't play
" nicely with `gq` formatting. It relies on a hack of treating bullets
" as comment characters.
" See https://github.com/plasticboy/vim-markdown/issues/232
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Filetype names and aliases for fenced code blocks.
let g:vim_markdown_fenced_languages = ['php', 'py=python', 'js=javascript', 'bash=sh', 'viml=vim']

" Highlight front matter (useful for Hugo posts).
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1

" Format strike-through text (wrapped in `~~`).
let g:vim_markdown_strikethrough = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
