if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'ggreer/the_silver_searcher'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/seoul256.vim'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

Plug 'bling/vim-bufferline'

Plug 'jiangmiao/auto-pairs'

Plug 'tomtom/tcomment_vim'

" Plug 'vim-scripts/closetag.vim'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'

" Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Valloric/YouCompleteMe'
" Plug 'ternjs/tern_for_vim'

" javascript completion
" must install tern: npm install -g tern
Plug 'carlitux/deoplete-ternjs'

" typescript completion
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" python completion
Plug 'zchee/deoplete-jedi'

Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

Plug 'majutsushi/tagbar'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'elzr/vim-json'

Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'
" Plug 'othree/javascript-libraries-syntax.vim'

" Vim plugin for rails development
Plug 'tpope/vim-rails'

" vim plugin for nodejs dev
Plug 'moll/vim-node'

" zoom into window splits and back out
" Plug 'ZoomWin'

" Go language support
Plug 'fatih/vim-go'

" Delete buffers without closing windows
Plug 'qpkorr/vim-bufkill'

" syntax for dockerfiles
Plug 'ekalinin/Dockerfile.vim'

" syntax for vue
Plug 'posva/vim-vue'

call plug#end()

" activates filetype detection
" filetype plugin on
" activates syntax highlighting among other things
" syntax on
" adds line #s on let
set number
" sets color scheme
colo seoul256

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set updatetime=250 " 250ms for updated signs, down from 4s default
let g:gitgutter_max_signs = 500  " default value

" open ~/.vimrc in new tab; :source on close
map <leader>vimrc :tabe $MYVIMRC<cr> 
autocmd bufwritepost .vimrc source $MYVIMRC

" buffers
map gn :bn<CR>
map gp :bp<CR>

" enhanced autocomplete; does this conflict w/ YouCompleteMe?
" set wildmenu

" fix cursor issues w/ tmux
if exists('$ITERM_PROFILE')
	if exists('$TMUX') 
		let &t_SI = "\<Esc>[3 q"
		let &t_EI = "\<Esc>[0 q"
	else
		let &t_SI = "\<Esc>]50;CursorShape=1\x7"
		let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	endif
end

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
	if !exists('$TMUX')
		return a:s
	endif

	let tmux_start = "\<Esc>Ptmux;"
	let tmux_end = "\<Esc>\\"

	return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Toggle tagbar to get overview of file class structure
nmap <F8> :TagbarToggle<CR>

" set standard tab width to 2 spaces (from default 8)
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set modeline

" allow jsx in normal js files
let g:jsx_ext_required = 0

" static typing with javascript flow.org
" let g:javascript_plugin_flow = 1

" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is '<leader>>'
"
let g:closetag_close_shortcut = '<leader>>'

" Map ctrl-n to toggling NERDTree
map <C-n> :NERDTreeToggle<CR>

" Allow buffer to be closed without terminating current window (showing said
" buffer). Note: I think other windows showing the closed buffer will still be
" terminated
command! Bd bp|bd#

let g:ackprg = 'ag --nogroup --nocolor --column'

" Fix javascript files with prettier, and then ESLint.
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'typescript': ['tslint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Keep vim from slowing down too much while syntax highlighting vue (single
" file components have multiple languages)
let g:vue_disable_pre_processors=1

" prevent vim from getting confused by multiple language vue files
autocmd FileType vue syntax sync fromstart

" set compound filetype to use existing html, css & javascript configurations
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" shortcut for :ALEFix by pressing <leader>d
nmap <leader>d <Plug>(ale_fix)

" keep sign gutter open
let g:ale_sign_column_always = 1

" Set this. Airline will handle the rest.
" let g:airline#extensions#ale#enabled = 1

" map movement through ALE errors with wrapping
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" show vim window for warnings or errors
" let g:ale_open_list = 1

" Enable completion via ALE where available.
" let g:ale_completion_enabled = 1

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
\ 'jsx',
\ 'javascript.jsx',
\ 'vue',
\ ]
