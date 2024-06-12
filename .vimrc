let mapleader=" "
set number
syntax on
set ruler
set wrap
set fdm=marker
set showmode
set encoding=utf-8
" set fillchars=eob:\ 

set autoindent
set tabstop=4
set shiftwidth=4
" set Cursorline
set textwidth=80
set showmatch
set hlsearch
set incsearch
set ignorecase

inoremap jk <Esc>
nnoremap S :w<CR>
nnoremap Q :q<CR>

" Update vim configuration file
nnoremap R :source $MYVIMRC<CR>
nnoremap J 5j
nnoremap K 5k


" Implement split screen in vim's normal mode and use shift+Q turn off split
" screen 
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>


" Switch between split screens opened in vim 
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h



" Create a new tab in vim 
map tu :tabe<CR>

" switch tabs in vim
map th :-tabnext<CR>
map tl :+tabnext<CR>

" Turn vim's spell check on or off 
map <LEADER>sc :set spell!<CR>





filetype on
filetype indent on
filetype plugin on 
filetype plugin indent on

let &t_ut=''
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif






" 设置 Vim 配置的基本项
set nocompatible              " 不要 vi 的兼容模式
filetype off                  " 用于在插件初始化时关闭文件类型检测
set rtp+=~/.vim/bundle/Vundle.vim " 设置 Vundle 插件管理器的运行文件路径


call plug#begin('~/.vim/plugged')
" 把你想安装的插件放在 plug#begin 和 plug#end 之间
" 这里是一个示例插件的格式：
Plug 'preservim/nerdtree'  " NERDTree，一个文件浏览器插件
Plug 'vim-airline/vim-airline'
Plug 'sindresorhus/vim-snazzy'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 例如，使用AutoPairs插件来自动补全括号和引号
Plug 'jiangmiao/auto-pairs'


" 安装 ALE 插件
Plug 'dense-analysis/ale'

Plug 'connorholyday/vim-snazzy'

call plug#end()

color snazzy
let g:SnazzyTransparent = 1



filetype plugin indent on    " 开启插件及缩进功能

" 设置一些个性化
set expandtab                 " 用空格代替 TAB
set tabstop=4                 " TAB 占用 4 个空格
set softtabstop=4             " 删除和退格时 TAB 占用 4 个空格
set shiftwidth=4              " 自动缩进也是 4 个空格
set smartindent               " 智能自动缩进
set wrap                      " 默认开启自动换行
set encoding=utf-8            " 设置默认编码为 UTF-8
set scrolloff=10              " 设置滚动时上下最少保留行数
set ruler
set showcmd

nnoremap tt :NERDTreeToggle<CR>

" 启用 airline
let g:airline#extensions#tabline#enabled = 1

" YouCompleteMe额外配置，根据需要进行
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'


function! InsertIabWrapper()
    let col = col('.') -1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else 
        return "\<C-n>"
    endif 
endfunction

inoremap <espr> <Tab> pumvisible() ? "\<C-n>" : InsertIabWrapper()




" 设置 syntastic
let g:syntastic_c_checkers = ['gcc', 'clang']
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" tagbar快捷键
nmap <F8> :TagbarToggle<CR>

nnoremap <F9> :w<CR>:!gcc % -o %< && ./%<<CR>


let g:coc_disable_startup_warning = 1

" 启用 ALE
" Ensure the runtime path includes the plugin directory
set runtimepath+=~/.vim/plugged/ale

" Enable ALE
let g:ale_linters_explicit = 1

" Enable linting for C files
let g:ale_linters = {
\   'c': ['clang', 'gcc'],
\}

" Enable fixers for C files (if any)
let g:ale_fixers = {
\   'c': [],
\}

" Automatically fix files on save (if any fixers are configured)
let g:ale_fix_on_save = 1

" Display ALE linting messages in a different way
let g:ale_echo_cursor = 1
let g:ale_sign_column_always = 1
