
" directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'ggreer/the_silver_searcher'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/seoul256.vim'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

Plug 'bling/vim-bufferline'

Plug 'jiangmiao/auto-pairs'

Plug 'tomtom/tcomment_vim'

Plug 'vim-scripts/closetag.vim'

Plug 'Valloric/YouCompleteMe'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'majutsushi/tagbar'

call plug#end()

set number

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

