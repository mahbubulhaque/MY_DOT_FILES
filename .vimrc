 set nocompatible              " be iMproved, required
 filetype off                  " required
" scriptencoding utf-8
" set encoding=utf-8

set noswapfile

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'

" --------------- Plugins to be installed -----------------------------
 Plugin 'tpope/vim-fugitive'
 Plugin 'airblade/vim-gitgutter'
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 Plugin 'markdownFootnotes'
" Plugin 'The-NERD-tree'
 Plugin 'scrooloose/nerdtree'
 Plugin 'Xuyuanp/nerdtree-git-plugin'
 Bundle "myusuf3/numbers.vim"
 Plugin 'jelera/vim-javascript-syntax'
 Plugin 'pangloss/vim-javascript'
 Plugin 'flazz/vim-colorschemes'
 Plugin 'lifepillar/vim-solarized8'
 Plugin 'othree/javascript-libraries-syntax.vim'
 Plugin 'burnettk/vim-angular'
" Plugin 'Valloric/YouCompleteMe'
 Plugin 'ycm-core/YouCompleteMe'
 Plugin 'surround.vim'
 Plugin 'kien/ctrlp.vim'
 Plugin 'scrooloose/syntastic'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'majutsushi/tagbar'
 Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
"=====================================================================

 call vundle#end()            " required
 filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

 set tabstop=4          " show existing tab with 4 spaces width
 set shiftwidth=4       " when indenting with '>', use 4 spaces width
 set expandtab          " On pressing tab, insert 4 spaces
" set autoread           " auto reload file if modified outside
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" ---------------- Put your non-Plugin stuff after this line ------------
"============================================================================
"============================================================================
 syntax enable
 set background=dark
" colorscheme bluedrake
" colorscheme desert
 colorscheme solarized8_dark
" set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<,nbsp:␣
 set listchars=tab:»·,eol:¬,trail:~,nbsp:·
 set list

"==========================: for typesript starts :===========================
"------: for using youcompleteme to have omni-completion automatically -------
"------: so that . gives the code completion shown --------
    if !exists("g:ycm_semantic_triggers")
        let g:ycm_semantic_triggers = {}
    endif
        let g:ycm_semantic_triggers['typescript'] = ['.']
"==========================: for typesript ends :=============================

"==========================:doing without plugin:start:=======================
" Search down into sub folders
" provide tab-completion for all file related tasks
 set path+=**

" Display all matching files when we tab complete
 set wildmenu

" TAG JUMPING:
" create the 'tags' file (may need to install ctags first)
 command! MakeTags !ctags -R .
"==========================:doing without plugin:ends:=======================

" Invisible character colors
" following 2 color specification is ignored as it is coming from colorscheme
" we are using
 highlight NonText guifg=#4a4a59
 highlight SpecialKey guifg='DarkGreen'

 :set ts=4 sw=4

 let mapleader = ","
 let maplocalleader = ","

 nmap <leader>ne : NERDTree<cr>
 map <silent> <C-n> :NERDTreeToggle<CR>

 let g:used_javascript_libs = 'angularjs,jquery'

 set number         " show line number
 nnoremap <F3> :NumbersToggle<CR>
 nnoremap <F4> :NumbersOnOff<CR>

" set cursorline     " highlight the current line
" set cursorcolumn
 highlight CursorLine ctermbg=darkgray

 set hlsearch       " highlight searched text
 set ignorecase     " case insensitive searching (unless specified)
 set smartcase      " override ignorcase if search text contains uppercase

 nnoremap <leader>b :TagbarToggle<cr>
 nnoremap <leader>. :CtrlPTag<cr>

" ---------- for opoening ctrlp with buffer directly
 nnoremap <c-b> :CtrlPBuffer<cr>
 nnoremap <c-m> :CtrlPMRU<cr>

" ---------- for coloring nerdTree different file extensions ----------
" NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
  endfunction

    call NERDTreeHighlightFile('js', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow','#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('jade', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff','#151515')

" ---------- for enabling folding -------------------------------------
 set foldmethod=indent
 set foldlevel=99
" following line is for folding comments
" syn match comment "\v(^\s*//.*\n)+" fold
" let g:SimpylFold_docstring_preview=1
" Set Space to Fold/Unfold
 nnoremap <space> za

" --------- saving folding -------------------------------------------
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview
 autocmd BufWinLeave *.* mkview
 autocmd BufWinEnter *.* silent loadview

" ----------- for coloring tab bar -----------------------------------
 hi TabLineFill term=bold cterm=bold ctermbg=0
" hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
" hi TabLine ctermfg=Blue ctermbg=Yellow
" hi TabLineSel ctermfg=Red ctermbg=Yellow

" hi TabLineFill cterm=none ctermfg=grey  ctermbg=cyan
" hi TabLine     cterm=none ctermfg=white ctermbg=cyan
" hi TabLineSel  cterm=none ctermfg=black ctermbg=white

" ------------ for switching last tab -------------------------------
 let g:lasttab = 1
 nnoremap <Leader>lt :exe "tabn ".g:lasttab<CR>
 au TabLeave * let g:lasttab = tabpagenr()

" ------------ for switching last buffer -----------------------------
" function SwitchBuffer()
"       b#
" endfunction

" noremap <leader>lb :call SwitchBuffer()<CR>
 nnoremap <leader>lb :b#<cr>
" ----------- ctrlp plugin ignoring directories ---------------------
 let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules|bower_components|vendors|env|static\/build|static\/bower',
    \ 'file': '\v\.(exe|so|dll|pyc)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" ---------------- This the syntastic plugin configuration --------------
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0
 let g:syntastic_javascript_checkers = ['eslint']

" --------------- This is the airline plugin configurarion --------------
" sets airline theme
 let g:airline_theme='solarized_flood'
 let g:airline_solarized_bg='dark'

 let g:airline_powerline_fonts = 1
 set t_Co=256

" Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1
" Show just the filename
 let g:airline#extensions#tabline#fnamemod = ':t'
" show tab index no and no of splits together
 let g:airline#extensions#tabline#tab_nr_type = 2
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
 set hidden

" --------------- HERE IS SOME EXPERIMENTAL MAPPING -------------
" open ~/.vimrc file for editing
 nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" save execute ~/.vimrc file as Vimscript
 nnoremap <leader>sv :source $MYVIMRC<cr>

"  let the terminal send its keycode to Vim
" set <S-Enter>={C-v}{S-Enter}
" set <A-j>={C-v}{A-j}
" set <A-k>={C-v}{A-k}
" --move line down: <A-j>
" nmap <C-V><alt-j> ddp
" --move line up: <A-k>
" nmap <C-V><alt-k> ddkkp
" --insert newline after current line:
" nmap <enter> o<esc>
" --insert newline before current line: <s-enter>
" nmap ^[0M O<esc>

"------------------ move line up and down ----------------------
 nnoremap <A-j> :m .+1<CR>==
 nnoremap <A-k> :m .-2<CR>==
 inoremap <A-j> <Esc>:m .+1<CR>==gi
 inoremap <A-k> <Esc>:m .-2<CR>==gi
 vnoremap <A-j> :m '>+1<CR>gv=gv
 vnoremap <A-k> :m '<-2<CR>gv=gv

 inoremap <leader>d> <esc>ddi
 inoremap <leader>u <esc>viwU<esc>i
 inoremap jk <esc>
 vnoremap jk <esc>
" inoremap <esc> <nop>
 nnoremap <leader>u viwU<esc>
 nnoremap <leader>l viwu<esc>
" nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" -------------- quote and unquote ------------------------
 nnoremap <Leader>" ciw""<esc>hp
 nnoremap <Leader>' ciw''<esc>hp
" delete quote doesn't work for all cases, need to optimize
 nnoremap <Leader>'d daW"=substitute(@@,"'\\\|\"","","g")<cr>p

 iabbrev ctrl controller
 iabbrev dir directive
 iabbrev fac factory

" --------------- Quicker window switch -------------------
 nnoremap <c-j> <c-w>j
 nnoremap <c-k> <c-w>k
 nnoremap <c-h> <c-w>h
 nnoremap <c-l> <c-w>l
" -------------- Quicker window movement ------------------
 nnoremap <c-j><c-j> <c-w>J
 nnoremap <c-k><c-k> <c-w>K
 nnoremap <c-h><c-h> <c-w>H
 nnoremap <c-l><c-l> <c-w>L
" -------------- Quicker tab switch -----------------------
 nnoremap <leader>1 1gt
 nnoremap <leader>2 2gt
 nnoremap <leader>3 3gt
 nnoremap <leader>4 4gt
 nnoremap <leader>5 5gt
 nnoremap <leader>6 6gt
 nnoremap <leader>7 7gt
 nnoremap <leader>8 8gt
 nnoremap <leader>9 9gt

 " <c-h> is interpreted as <bs> in neovim
" This is a bandaid fix until the team decides how
" they want to handle fixing
" it...(https://github.com/neovim/neovim/issues/2048)

" --------------- Resize Window ---------------------------
 nnoremap <silent> <Right> :vertical resize +5<cr>
 nnoremap <silent> <Left> :vertical resize -5<cr>
 nnoremap <silent> <Up> :resize -5<cr>
 nnoremap <silent> <Down> :resize +5<cr>

" --------------- Saving file -----------------------------
" --------------- Map Ctrl + s to save in any mode --------
" following <c-s> won't work untill .zshrc is updated with
" 'stty -ixon' command, as terminal has its own <c-s> command
 noremap <silent> <c-s>          :update<cr>
 vnoremap <silent> <c-s>         <c-c>:update<cr>
 inoremap <silent> <c-s>         <c-o>:update<cr>
" Also map leader + s
 map <leader>s <c-s>
"  noremap <c-s> :w<cr>

" -------------- comment/uncomment visually selected block --
 vnoremap <leader>c <c-v>I// <esc>
 vnoremap <leader>cc <c-v>lld<esc>

" -------------- comment/uncomment visually selected block --
 nnoremap <leader>ii gg=G`z
 map <F7> mzgg=G`z
 autocmd FileType javascript nnoremap <buffer><localleader>c I// <esc>
" highlight Comment gui=italic
" highlight Comment cterm=italic
" highlight htmlArg gui=italic
" highlight htmlArg cterm=italic
" testing ssh key added correctly or not at binate
" another testing
" --------------- EXPERIMENTAL MAPPING ENDS --------------
