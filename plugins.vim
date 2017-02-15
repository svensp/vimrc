set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'rking/ag.vim'

Plugin 'skwp/greplace.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'craigemery/vim-autotag'

" Shows git status flags in nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'low-ghost/nerdtree-fugitive'

Plugin 'vim-scripts/a.vim'

"Plugin 'vim-scripts/ShowMarks'

Plugin 'ervandew/supertab'

Plugin 'SirVer/ultisnips'

Plugin 'Valloric/YouCompleteMe'

" Plugin 'honza/vim-snippets'

Plugin 'w0ng/vim-hybrid'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'kien/ctrlp.vim'

"Plugin 'vim-scripts/ClosePairs'

"Plugin 'vim-scripts/DoxygenToolkit.vim'

"Plugin 'tpope/vim-commentary'
"Plugin 'shawncplus/phpcomplete.vim'
"
"Plugin 'tobyS/vmustache'
"Plugin 'tobyS/pdv'

Plugin 'tpope/vim-surround'

"Plugin 'tpope/vim-characterize'

"Plugin 'tpope/vim-abolish'

"Plugin 'tpope/vim-repeat'

"Plugin 'tmhedberg/matchit'

"Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'

Bundle 'LucHermitte/lh-vim-lib'
"Bundle 'LucHermitte/vim-build-tools-wrapper'
Bundle 'LucHermitte/lh-tags'
Bundle 'LucHermitte/lh-dev'
Bundle 'LucHermitte/lh-brackets'
Bundle 'LucHermitte/searchInRuntime'
Bundle 'LucHermitte/mu-template'
Bundle 'tomtom/stakeholders_vim'
Bundle 'LucHermitte/alternate-lite'
Bundle 'LucHermitte/lh-cpp'
Plugin 'LucHermitte/vim-refactor'
Plugin 'LucHermitte/local_vimrc'

" yaml
Plugin 'avakhov/vim-yaml'

Plugin 'smerrill/vcl-vim-plugin'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on    " required

