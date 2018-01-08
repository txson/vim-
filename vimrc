set nu
set ruler							" 显示标尺
set autoread						" 设置当文件被改动时自动载入
set completeopt=preview,menu		" 代码补全
set clipboard+=unnamed				" 共享剪贴板
set nobackup						" 从不备份
set autowrite						" 自动保存
"set cursorline						" 突出显示当前行
set cursorcolumn					" 高亮显示列
set confirm							" 在处理未保存或只读文件的时候，弹出确认
set autoindent						" 自动缩进
set tabstop=4						" Tab键的宽度
set noexpandtab						" 不要用空格代替制表符
set smarttab						" 在行和段开始处使用制表符
set number							" 显示行号
set noswapfile						" 不要生成swap文件
set ignorecase						" 搜索忽略大小写
set hlsearch						" 搜索逐字符高亮
set iskeyword+=_,$,@,%,#,-			" 带有如下符号的单词不要被换行分割
set showmatch						" 高亮显示匹配的括号
set matchtime=1						" 匹配括号高亮的时间（单位是十分之一秒）
set smartindent						" 为C程序提供自动缩进
set tags=.tags;						" 设置 tags
set autochdir						" ctags 在跳转时找不到ctags文件会自动去父目录找
set background=dark					" 主题设置成黑模式
set shiftwidth=4					" 设置移动宽度
set nofoldenable					" 关闭自动折叠代码功能
set cc=100							" 设置右边标尺
set wildmenu						" 状态栏tab显示备选
set scrolloff=10					" 光标移动到buffer的顶部和底部时保持10行距离
set clipboard=unnamed				" 默认使用系统剪切板
set paste							" 关闭黏贴时乱缩进
"set relativenumber					" 启用相对行号

set background=dark 
let g:solarized_termcolors=256  
let g:solarized_termtrans=1   
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"  
colorscheme molokai					" 配色使用
"colorscheme solarized					" 配色使用

let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1			"不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28				"设置taglist的宽度
let Tlist_Exit_OnlyWindow=1			"如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1		"在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1			"在左侧窗口中显示taglist窗口 
" 打开和关闭Tlist的快捷键
map <F6> :Tlist<CR>

"设jutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_width=30                   "窗口宽度的设置
" 打开和关闭tagbar的快捷键
map <F7> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启

"设置界面分割
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager按键
nmap <F8> :WMToggle<CR>

" 文件搜索 快捷键是ctrl+p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 0
let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ctag的设置
set autochdir
set tags=tags;
map <c-]> g<c-]>

if has("cscope")
	" set csprg=/usr/bin/cscope
	set cst
	set nocsverb

	" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	 set cscopetag
	" show msg when any other cscope db added
	" set cscopeverbose
	" check cscope for definition of a symbol before checking ctags: set to 1
	" if you want the reverse search order.
	set csto=0

	" set cscopequickfix=s-,c-,d-,i-,t-,e-

	"add any database in current dir
	if filereadable("cscope.out")
		cs add cscope.out
	" else search cscope.out elsewhere
	else
		let cscope_file=findfile("cscope.out", ".;")
		let cscope_pre=matchstr(cscope_file, ".*/") 
		" echo cscope_file
		if !empty(cscope_file) && filereadable(cscope_file) 
			exe "cs add" cscope_file cscope_pre
		endif
	endif
endif
	set csverb

map <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
map <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
map <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
map <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
map <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
map <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
map <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
map <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" vundle的设置
set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" 另一种选择, 指定一个vundle安装插件的路径
	"call vundle#begin('~/some/path/here')

	" 让vundle管理插件版本,必须
	Plugin 'VundleVim/Vundle.vim'

	" 以下范例用来支持不同格式的插件安装.
	" 请将安装插件的命令放在vundle#begin和vundle#end之间.
	" Github上的插件
	" 格式为 Plugin '用户名/插件仓库名'
	Plugin 'tpope/vim-fugitive'
	" 来自 http://vim-scripts.org/vim/scripts.html 的插件
	" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
	Plugin 'L9'
	Plugin 'Tagbar'
	Plugin 'taglist.vim'
	Plugin 'winmanager'
	Plugin 'godlygeek/tabular'
	Plugin 'Markdown'
"	Plugin 'instant-markdown.vim'
	Plugin 'suan/vim-instant-markdown'
	Plugin 'Valloric/YouCompleteMe'						  		"自动补齐
	Plugin 'ctrlp.vim'                                    		"文件搜索
	Plugin 'tomasr/molokai'									  	"一种颜色主题
	Plugin 'bling/vim-airline'							  		"状态栏增强
	Plugin 'altercation/vim-colors-solarized'
	" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"	Plugin 'git://git.wincent.com/command-t.git'
	" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"	Plugin 'file:///home/gmarik/path/to/plugin'
	" 插件在仓库的子目录中.
	" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"	Plugin 'ascenator/L9', {'name': 'newL9'}

	" 你的所有插件需要在下面这行之前
	call vundle#end()            " 必须
	filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
	" 忽视插件改变缩进,可以使用以下替代:
	"filetype plugin on
	"
	" 常用的命令
	" :PluginList       - 列出所有已配置的插件
	" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
	" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
	" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
	"
	" 查阅 :h vundle 获取更多细节和wiki以及FAQ
	" 将你自己对非插件片段放在这行之后


" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"] 
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
"let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
" let g:ycm_use_ultisnips_completer=0
"
