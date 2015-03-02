"Powerline {{{1
"用于提供状态栏
"不由Vundle控制，而是使用系统中安装的Powerline软件
"和tagbar一同使用时，打开部分py文件十分慢
" Plugin 'Lokaltog/powerline'
" let g:Powerline_symbols = 'fancy'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Vundle {{{1
"关闭兼容模式
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

""TagList设置"{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""禁止自动改变当前vim窗口大小
"let Tlist_Inc_Winwidth=0
""把方法列表放在屏幕右侧
"let Tlist_Use_Right_Window=1
""让当前不被编辑的文件的方法列表自动折叠
"let Tlist_File_Fold_Auto_Close=1

""Airline {{{1
"Plugin 'bling/vim-airline'
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

"Vim-CtrlSpace {{{1
"控制vim的buffers,tabs,windows,workspace等功能的插件
Plugin 'szw/vim-ctrlspace'
set hidden
let g:airline_exclude_preview=1
let g:ctrlspace_default_mapping_key="<leader><space>"

"NERDTree {{{1
"用于查看文件夹结构
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.o$', '\.pyc$', '\~$']
nmap ,nt :NERDTree<cr>
nmap ,nf :NERDTreeFind<cr>
autocmd FileType nerdtree setlocal nocursorcolumn

""NERDTreeTab {{{1
"新建tab时也新建NERDTree，并保持NERDTree在所有tab间同步
"Plugin 'jistr/vim-nerdtree-tabs'
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_synchronize_view=0
"let g:nerdtree_tabs_synchronize_focus=0

"YouCompleteMe {{{1
"用于自动补全
Plugin 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '/home/sandnon/.ycm_global_ycm_extra_conf'
let g:ycm_key_invoke_completion = '<C-n>'

"UltiSnips {{{1
"用于插入自定义的代码片段
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsSnippetDirectories=['bundle/vim-snippets/UltiSnips', 'UltiSnips']
"ftdetect/UltiSnips.vim中的代码无法正常运行
"因此手动调用代码
au BufRead,BufNewFile * call UltiSnips#FileTypeChanged()

"Tagbar {{{1
"用于显示outline
Plugin 'majutsushi/tagbar'
nmap ,tb :TagbarToggle<cr>
"tagbar窗口中的cursorline和cursorcolumn打开的话移动起来很卡，因此关闭
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

"Rainbow Parentheses {{{1
"用于括号加色
Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"A.vim {{{1
"在源文件和头文件间快速切换
Plugin 'vim-scripts/a.vim'

"EasyMotion {{{1
"用于快速移动
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key=','

"matchit {{{1
"用于在标签间实现跳转
Plugin 'vim-scripts/matchit.zip'

""NerdCommenter {{{1
"用于快速批量加减注释
",cc增加注释; ,cu消除注释
"Plugin 'scrooloose/nerdcommenter'
let mapleader=','
let maplocalleader=','

"tComment {{{1
"用于快速批量加减注释
Plugin 'tomtom/tcomment_vim'

"DelimitMate {{{1
"用于括号和引号自动补全
Plugin 'Raimondi/delimitMate'

"Surround {{{1
"快速给词环绕加括号或引号
"csAB 将A换成B
"ysiwA 在iw上增加A
"dsA 删除环绕的A
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

"Multiple Cursors {{{1
"用于多光标批量操作
"使用CTRL+N选择，CTRL+P取消选择，CTRL+X取消并跳过选择
Plugin 'terryma/vim-multiple-cursors'

""pyflakes {{{1
"Plugin 'kevinw/pyflakes-vim'

"Syntastic {{{1
Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_python_checkers=['pyflakes', 'python']
let g:syntastic_cpp_checkers=['']
let g:syntastic_check_on_open=1
let g:syntastic_full_redraws=0

"TaskList {{{1
"查看代码中的TODO
Plugin 'vim-scripts/TaskList.vim'
map <unique> <Leader>td <Plug>TaskList

""CVIM {{{1
"C/C++支持
"Plugin 'vim-scripts/c.vim'
"let g:C_MapLeader = ','

"python-syntax {{{1
"Python语法高亮
Plugin 'hdima/python-syntax'

"vim-markdown {{{1
"Markdown语法高亮
au BufRead,BufNewFile *.md set filetype=markdown
Plugin 'plasticboy/vim-markdown'

"django.vim {{{1
"django html语法高亮
Plugin 'vim-scripts/django.vim'

""vim-javascript {{{1
""Javascript语法高亮
"Plugin 'pangloss/vim-javascript'

"vim-jquery.vim {{{1
"jquery语法高亮
Plugin 'nono/jquery.vim'
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery

""vim-indexer {{{1
""自动生成tags
""为了避免生成tags时阻塞，使用client server模式启动vim
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'vim-scripts/indexer.tar.gz'
"let g:indexer_disableCtagsWarning=1

"vim-expand-region {{{1
"区块伸缩
Plugin 'terryma/vim-expand-region'

"molikai {{{1
"类Sublime text2配色
Plugin 'tomasr/molokai'

"closetag {{{1
"html/xml标签配对补全
Plugin 'docunext/closetag.vim'

"emmet {{{1
"web开发工具
Plugin 'mattn/emmet-vim'

"vim-signaature {{{1
"mark插件
Plugin 'kshenoy/vim-signature'
let g:SignaturePurgeConfirmation=1
let g:SignatureMap = {
            \ 'ToggleMarkAtLine'   :  "m<Space>",
            \ 'PurgeMarks'         :  "m."
            \ }
noremap '? :marks<cr>

"wmgraphviz {{{1
"Graphviz插件
Plugin 'wannesm/wmgraphviz.vim'
let g:WMGraphviz_output='png'

"vim-css3-syntax {{{1
"css3语法高亮
Plugin 'hail2u/vim-css3-syntax'

"vim-less {{{1
"less语法高亮
Plugin 'groenewege/vim-less'

"vim-tmux-navigator {{{1
"和tmux结合使用的vim插件。用于实现使用ctrl+h/j/k/l在tmux和vim的窗口间无缝切换
" Plugin 'christoomey/vim-tmux-navigator'

"vim-fugitive {{{1
"Git插件
Plugin 'tpope/vim-fugitive'

""代码补全设置"{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags+=~/.vim/systags
""将code_complete中的热键改为C-b以防与supertab冲突
"let g:completekey="<C-b>"
""离开插入模式后自动关闭预览窗口
""autocmd CursorMovedI * if pumvisible() == 0 | pclose | endif
""autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
""修改OmniCpp的默认命名空间为std
"let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
"let OmniCPP_SelectFirstItem = 2
""此为默认值，不需要设置
""let OmniCpp_NamespaceSearch = 1
""使C-support为.h文件应用模板
"let g:C_SourceCodeExtensions = "h cc c cpp cxx cp CPP c++ C i ii"
""自动补全
"let g:acp_completeoptPreview = 1

"字符编码配置"{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8,gb2312,gbk,gb18030
set fileformats=unix,dos

""颜色设置{{{1
"let g:solarized_termcolors=256
"colo solarized
"修改Visual选中字符颜色
"highlight Visual ctermbg=LightBlue
"highlight Visual ctermfg=DarkBlue
"修改行号配色
"highlight LineNr ctermbg=LightGray
"highlight LineNr ctermfg=DarkGray

"Vundle结束标记{{{1
call vundle#end()
filetype plugin indent on

"基本配置"{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"命令行补全以增强模式运行
set wmnu
"打开自动 C 程序缩进
set cin
"打开搜索高亮
set hlsearch
"打开语法高亮
syntax enable
"自动保存
set autowrite
"自动读取外界修改的文件
set autoread
"显示行号
set number
"记录历史的行数
set history=1000
"背景为暗色
set background=dark
"自动对齐
set autoindent
"智能对齐
set smartindent
"设置tab键为4个空格
set tabstop=4
"缩进每一步使用的空白数目
set shiftwidth=4
"展开tab为空格
set expandtab
"匹配模式
set showmatch
"开启自动断行
set linebreak
"开启搜索的智能大小写判断
set ignorecase smartcase
"显示光标位置的行号和列号，逗号分隔
set ruler
"输入搜索命令时，显示目前输入的模式的匹配位置
set incsearch
"设置十字光标
set cursorline
set cursorcolumn
"设置 Vim 内部使用的字符编码
set enc=utf-8
"设置根据语法折叠
set foldmethod=syntax
"默认展开所有fold
set foldlevel=99
"设置高亮风格。没有这项设置的话选项是黑色字黑色背景
"hi PmenuSel ctermfg=White
"记住上次打开时指针位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
"将此变量预先赋空
let g:C_Libs=""
"设置vim色彩为256色
set t_Co=256
"设置vim始终显示状态栏
set laststatus=2
"设置相对行号
set relativenumber
"交换'和`
nnoremap ' `
nnoremap ` '
"色彩方案
if &t_Co > 255
    colo molokai
    highlight Search cterm=bold ctermfg=135
else
    colo desert
end
"取消高亮
map <leader>/ :nohlsearch<cr>
"窗口切换
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"窗口最大化
noremap <C-w>m <C-w>_
"窗口还原 <C-w>=
"使用ctrl-p替代原来ctrl-l的刷新功能
map <c-p> :redraw!<cr>
"新建tab
" nnoremap <C-t> :tabnew<cr>
"切换到指定tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"Cscope配置"{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory 
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

function CscopeRefresh()
    execute "!cscope -bRq"
    execute "cscope kill 0"
    execute "cscope add ."
endfunction

command CS call CscopeRefresh()

"C++配置"{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ,rr :!g++ % -o '%:r' && ./'%:r'<cr>
nmap ,rm :!make<cr>

"Python配置"{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal et sta sw=4 sts=4
"let g:pydiction_location = '~/.vim/pydiction-1.2/complete-dict'

"Markdown配置{{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *.md,*.markdown silent !markdown % > %:r.html

""OpenGL设置"{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:C_Libs.="-lm -lGL -lglut -lGLU"

"html,css,less,php缩进 {{{1
autocmd FileType html,css,less,php setlocal tabstop=2 | setlocal shiftwidth=2

"vim {{{1
" vim: fdm=marker foldlevel=0:

