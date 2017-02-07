set nocompatible              " required
filetype off                  " required
set nu
"au BufNewFile,BufRead *.py
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set fileformat=unix
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'hdima/python-syntax'
"plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'scrooloose/syntastic'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
"Bundle 'scrooloose/syntastic'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
"Plugin 'flazz/vim-colorschemes'

"Bundle 'tpope/vim-fugitive'
"Bundle 'airblade/vim-gitgutter'
Bundle 'klen/python-mode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split  navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
"set foldmethod=indent
"set foldlevel=99
"Enable folding with the spacebar
"nnoremap <space> za

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"syntax enable
"let g:syntastic_python_checkers = ['pylint']

"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif

"colorscheme solarized
set t_Co=256
"colors zenburn
"colorscheme elflord
colorscheme molokai
"colorscheme desert

autocmd vimenter * NERDTree 
" NERDTree config
 map <F2> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

 map <F4> :q<CR>
 map <F1> :w<CR>

nmap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
map <F6> :SyntasticCheck<CR>
im <F6> <Esc>:SyntasticCheck<CR>

augroup vimrc_autocmds
    autocmd!
    "highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=DarkGrey
    "guibg=yellow
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    augroup END

" ======= 恢复上次文件打开位置 ======= "  
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

