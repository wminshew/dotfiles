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

" Plug 'Valloric/YouCompleteMe'
" Plug 'ternjs/tern_for_vim'
" Plug 'Shougo/neocomplete.vim'

Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

Plug 'majutsushi/tagbar'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'elzr/vim-json'

Plug 'vim-syntastic/syntastic'
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

call plug#end()

" activates filetype detection
filetype plugin on
" activates syntax highlighting among other things
syntax on
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
set wildmenu

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

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

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

" syntastic recommended starter settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
