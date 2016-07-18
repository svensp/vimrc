set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'rking/ag.vim'

Plugin 'skwp/greplace.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-scripts/a.vim'

"Plugin 'vim-scripts/ShowMarks'

Plugin 'ervandew/supertab'

Plugin 'SirVer/ultisnips'

Plugin 'Valloric/YouCompleteMe'

" Plugin 'honza/vim-snippets'

Plugin 'w0ng/vim-hybrid'

Plugin 'xsbeats/vim-blade'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'kien/ctrlp.vim'

"Plugin 'vim-scripts/ClosePairs'

Plugin 'vim-scripts/DoxygenToolkit.vim'

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

Plugin 'tpope/vim-fugitive'

Bundle 'LucHermitte/lh-vim-lib'
Bundle 'LucHermitte/lh-tags'
Bundle 'LucHermitte/lh-dev'
Bundle 'LucHermitte/lh-brackets'
Bundle 'LucHermitte/searchInRuntime'
Bundle 'LucHermitte/mu-template'
Bundle 'tomtom/stakeholders_vim'
Bundle 'LucHermitte/lh-cpp'
Plugin 'LucHermitte/vim-refactor'
Plugin 'LucHermitte/local_vimrc'

" yaml
Plugin 'avakhov/vim-yaml'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on    " required
