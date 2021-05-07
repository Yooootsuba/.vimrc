" Yotsuba's .vimrc
"
"
" 1. General settings
" 2. Plugins
" 3. Plugins settings
" 4. Scheme and colors
" 5. Key mappings
" 6. Filetype settings
"


" ----------------------------------------------------------------
" 1. General settings ( start )
" ----------------------------------------------------------------


set scrolloff=20
set relativenumber
set nowrap
set showcmd
set incsearch
set tabstop=4
set shiftwidth=4
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
Plugin 'mg979/vim-visual-multi'
Plugin 'vim-vdebug/vdebug'

call vundle#end()


" ----------------------------------------------------------------
" 2. Plugins ( end )
" ----------------------------------------------------------------


" ----------------------------------------------------------------
" 3. Plugins settings ( start )
" ----------------------------------------------------------------


" NERDTree settings
let g:NERDTreeWinSize=25
" nnoremap <c-t> :NERDTreeToggle<cr>

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


" vim-airline settings
let g:airline#extensions#tabline#enabled = 1


" vim-syntastic/syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" vdebug settings
let g:vdebug_keymap = {
    \    "run"               : "<F5>",
    \    "run_to_cursor"     : "<F9>",
    \    "step_over"         : "<F2>",
    \    "step_into"         : "<F3>",
    \    "step_out"          : "<F4>",
    \    "close"             : "<F6>",
    \    "detach"            : "<F7>",
    \    "set_breakpoint"    : "<F1>",
    \    "get_context"       : "<F11>",
    \    "eval_under_cursor" : "<F12>",
    \    "eval_visual"       : "<Leader>e",
    \}
let g:vdebug_options = {
    \   "simplified_status" : 0,
    \}


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
nnoremap <c-h> :bprev<cr>
nnoremap <c-l> :bnext<cr>

nnoremap Q <nop>

nnoremap <c-n> :call NumberToggle()<cr>
nnoremap <c-w> :call CloseBuffer()<cr>

nnoremap <c-t> <c-w>w


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
