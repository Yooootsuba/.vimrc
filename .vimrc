" Yotsuba's .vimrc
"
"
" 1. General settings
" 2. Plugins
" 3. Plugins settings
" 4. Scheme and colors
" 5. Key mappings
" 6. Filetype settings


" ----------------------------------------------------------------
" 1. General settings ( start )
" ----------------------------------------------------------------


set scrolloff=20
set relativenumber
set nowrap
set showcmd
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set numberwidth=10
set nocompatible
set expandtab
set smartindent
set hidden
set backspace=indent,eol,start
set splitbelow
set formatoptions-=cro
set virtualedit=all
set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8


" ----------------------------------------------------------------
" 1. General settings ( end )
" ----------------------------------------------------------------


" ----------------------------------------------------------------
" 2. Plugins ( start )
" ----------------------------------------------------------------


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'easymotion/vim-easymotion'
Plugin 'machakann/vim-highlightedyank'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'tibabit/vim-templates'
Plugin 'junegunn/fzf'


call vundle#end()


" ----------------------------------------------------------------
" 2. Plugins ( end )
" ----------------------------------------------------------------


" ----------------------------------------------------------------
" 3. Plugins settings ( start )
" ----------------------------------------------------------------


" FZF settings
nnoremap <c-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_colors = { 'border': ['fg', 'Ignore'] }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true} }


" NERDTree settings
let g:NERDTreeWinSize=25

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() != 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Easymotion settings
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


" vim-highlightedyank settings
let g:highlightedyank_highlight_duration = 300


" YouCompleteMe settings
set completeopt-=preview
let g:ycm_disable_signature_help = 1
let g:ycm_filetype_whitelist = {'*': 1}
let g:ycm_log_level = "error"

let g:ycm_filter_diagnostics = {
  \ 'c': {
  \      'regex': ['warning'],
  \      'level': 'warning',
  \    },
  \ }


" vim-airline settings
let g:airline#extensions#tabline#enabled = 1


" vim-syntastic/syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_checkers = []
let g:syntastic_python_checkers = []


" vim-templates settings
let g:tmpl_search_paths = ['~/.vim/templates']


" ----------------------------------------------------------------
" 3. Plugins settings ( end )
" ----------------------------------------------------------------


" ----------------------------------------------------------------
" 4. Scheme and colors ( start )
" ----------------------------------------------------------------


syntax on
set term=screen-256color
colorscheme jellybeans


" ----------------------------------------------------------------
" 4. Scheme and colors ( end )
" ----------------------------------------------------------------


" ----------------------------------------------------------------
" 5. Key mappings ( start )
" ----------------------------------------------------------------


nnoremap <c-s> :update<cr>
nnoremap <c-j> :bprev<cr>
nnoremap <c-k> :bnext<cr>
nnoremap <c-n> :call NumberToggle()<cr>
nnoremap Q :call CloseBuffer()<cr>


" ----------------------------------------------------------------
" 5. Key mappings ( end )
" ----------------------------------------------------------------


" ----------------------------------------------------------------
" 6. Helper functions ( start )
" ----------------------------------------------------------------


" Relative or absolute number lines
function! NumberToggle()
    if (&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction


" Close buffer
function! CloseBuffer()
    let l:number = bufnr('%')
    bnext
    execute 'bw ' . l:number
endfunction


" ----------------------------------------------------------------
" 6. Helper functions ( end )
" ----------------------------------------------------------------


" ----------------------------------------------------------------
" 7. Filetype settings ( start )
" ----------------------------------------------------------------


filetype off
filetype plugin indent on

" Remove unwanted spaces
autocmd BufWritePre * %s/\s\+$//e


" ----------------------------------------------------------------
" 7. Filetype settings ( end )
" ----------------------------------------------------------------
