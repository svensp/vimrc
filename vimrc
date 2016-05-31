set nobackup
set t_Co=256
syntax on
" Backspace wie sonst überall auch
set backspace=2

" If you're using a symlink to your script, but your resources are in
" the same directory as the actual script, you'll need to do this:
"   1: Get the absolute path of the script
"   2: Resolve all symbolic links
"   3: Get the folder of the resolved absolute file
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')


" no bell
set noerrorbells
set novisualbell
set vb t_vb=


" Zeilennumer
set number
" suche groß/klein ignorieren
set ignorecase
" sobald Großschreibung in suchwort vorhandend -> groß/klein nichtmehr
" ignorieren
set smartcase
set scrolloff=4
set textwidth=80
set tags=tags;/
let mapleader = ","
" Mit Control+Key genauso navigieren wie in dateien
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <leader>a :A<CR>
map <leader>n :cn<CR>
map <leader>p :cp<CR>
map <leader>m :make<CR>
map <leader>] :YcmCompleter GoTo<CR>
imap jj <ESC>
imap <F9> <Plug>PreviewWord
map <F9> <Plug>PreviewWord
imap <F10> <Plug>ClosePreviewWindow
map <F10> <Plug>ClosePreviewWindow

execute "source ".s:path."/plugins.vim"

let g:pdv_template_dir=$HOME .'/.vim/bundle/pdv/templates_snip'

filetype plugin on
filetype indent on

let g:EclimProjectTreeExpandPathOnOpen = 1
let g:EclimSignLevel = 2
let g:EclimProjectTreeAutoOpen = 1
let g:EclimProjectTreeActions = [
    \ {'pattern': '.*', 'name': 'Edit', 'action': 'edit'},
    \ {'pattern': '.*', 'name': 'Split', 'action': 'split'},
    \ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'},
  \ ]
set ts=3
set sw=3
" set sta=3

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
	 echo g:ulti_expand_res
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

"let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:snips_author="Sven Speckmaier"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if bufexists(2)
split
buffer 2
endif

" NerdTree
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1

let NERDTreeIgnore=['.*\.o', '\~$']
let NERDTreeDirArrows=1
let NERDTreeSortOrder=['\/$', '((\.h$)|(\.cpp$))', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeWinSize=25

" Enable Alt-1 in sterm
execute "set <A-1>=\e1"
nnoremap <A-1> :NERDTreeToggle<CR>
inoremap <A-1> <ESC>:NERDTreeToggle<CR>
"NERDTreeAddKeyMap({'key':'c',
"					\'callback':'NERDTreeNewFiles'
"					\'quickhelpText':'Invoke newfiles script'
"					\'scope': 'Node'
"})

" Folding
set foldmethod=syntax
set foldlevel=1
set foldnestmax=1
autocmd BufRead,BufNewFile   *.h silent! 2foldc
autocmd BufRead,BufNewFile   *.cpp set foldlevel=0
autocmd BufRead,BufNewFile   *.cpp set foldlevel=0
noremap <C-a> za
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
source ~/.vim/folding.vim

" lh-cpp
autocmd BufNew let b:usemarks=0
"let g:load_doxygen_syntax=1
autocmd BufNew let b:cb_jump_on_close=1
map <C-n> <Plug>MarkersJumpF
map <C-p> <Plug>MarkersJumpB
imap <C-n> <Plug>MarkersJumpF
imap <C-p> <Plug>MarkersJumpB
autocmd Filetype cpp map <C-d> <ESC>:Dox<CR>
autocmd FileType php map <c-d> :call pdv#DocumentWithSnip()<CR>

"Ctrl-P
let g:ctrlp_map = '<c-t>'

"EasyMotion
map <C-m> <Plug>(easymotion-bd-j)
map / <Plug>(easymotion-sn)
let g:EasyMotion_startofline = 0
map <C-j> <Plug>(easymotion-w)
map <C-k> <Plug>(easymotion-b)

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_use_ultisnips_completer=0
map <C-g> :YcmCompleter GoToDeclaration<CR>
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_complete_in_strings = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_show_diagnostics_ui = 1
let g:ycm_key_list_select_completion = ['<C-Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-Tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'

"Snipmate
let g:snip_author='Sven Speckmaier'
"imap <C-z> <Plug>snipMateBack
"smap <C-z> <Plug>snipMateBack
imap <C-a> <esc><Plug>snipMateNextOrTrigger
smap <C-a> <esc><Plug>snipMateNextOrTrigger

if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=8
endif

" Colorscheme
set background=dark
"let g:lucius_contrast='high'
"let g:lucius_use_underline=0
"colorscheme lucius
"LuciusBlack
let g:hybrid_use_Xresources = 1
colorscheme hybrid

set cmdheight=1
set wildmenu
set wildignore=*.o,*~,*.pyc
set lazyredraw

set showmatch
set mat=2

set encoding=utf8
set nobackup
set noswapfile
set laststatus=2

autocmd BufRead,BufNewFile   * set cmdheight=1
" Fix blade auto-indent"
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade

" Pasting
set pastetoggle=<F6>
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return '==PASTE MODE== '
    en
    return ''
endfunction

" Visual
"set statusline=\ %{HasPaste()}%f%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"set statusline=%{HasPaste()}%f
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline=%{HasPaste()}
set statusline+=%-2.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

set viewoptions-=options
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" let g:c_nl_before_curlyB = 0
" let g:marker_select_empty_marks = 0
let g:ShowVirtual = 0
let g:ShowStatic = 0
map <Leader>i :GOTOIMPL<CR>

let g:lh_cpp_snippets = 0 
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set exrc
set secure

execute "source ".s:path."/initialize.vim"

"
" Inside:
" ci) edit inside the surrounding ()
" ca) edit inside, including the surrounding ()
" Surround:
" cs"' movement change surrounding " to '
"
" Marks:
" mletter -> buffer intern mark
" mLETTER -> global mark
" 'letter / 'LETTER -> return to mark
"

