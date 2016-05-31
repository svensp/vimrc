"=============================================================================
" File:         myvimrc/cppmenu.vim                               {{{1
" Author:       cmd-keen
" Version:      0.0.1
let s:k_version = 001
" Created:      28th Apr 2016
" Last Update:  28th Apr 2016
"------------------------------------------------------------------------
" Description:
"       Add create option to create .h and .cpp file as NERDTree menu item
"
"------------------------------------------------------------------------
" History:      «history»
" TODO:         «missing features»
" }}}1
"=============================================================================

let s:cpo_save=&cpo
set cpo&vim
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:

" Adapted from NERDTree NERDTreeAddNode()
" Thanks to its maintainer Martin Grenfell
function! s:CreateNode(newNodeName)
	let newNodeName=a:newNodeName
    try
        let newPath = g:NERDTreePath.Create(newNodeName)
        let parentNode = b:NERDTree.root.findNode(newPath.getParent())

        let newTreeNode = g:NERDTreeFileNode.New(newPath, b:NERDTree)
        if empty(parentNode)
            call b:NERDTree.root.refresh()
            call b:NERDTree.render()
        elseif parentNode.isOpen || !empty(parentNode.children)
            call parentNode.addChild(newTreeNode, 1)
            call NERDTreeRender()
            call newTreeNode.putCursorHere(1, 0)
        endif
    catch /^NERDTree/
        call nerdtree#echoWarning("Node Not Created.")
    endtry
endfunction

function! CreateSourceFiles()
    let curDirNode = g:NERDTreeDirNode.GetSelected()

    let newNodeName = input("Add a child source\n".
                          \ "==========================================================\n".
                          \ "Enter the source name without exteionsion to be created. \n" .
                          \ "", curDirNode.path.str() . g:NERDTreePath.Slash(), "file")

    if newNodeName ==# ''
        call nerdtree#echo("Node Creation Aborted.")
        return
    endif

	 let sourceName=newNodeName.'.cpp'
	 let headerName=newNodeName.'.h'

	 call s:CreateNode(sourceName)
	 call s:CreateNode(headerName)

endfunction

function! CreateSourceFilesActive()
	return 1
endfunction

if( !exists("s:loaded") )
	let s:loaded = 0
endif

if( s:loaded == 0)
	call NERDTreeAddMenuItem({
				\ 'text': 'Add .cpp and .h (s)ource files',
				\ 'shortcut': 's',
				\ 'callback': 'CreateSourceFiles',
				\ 'isActiveCallback': 'CreateSourceFilesActive' })
	let s:loaded=1
endif
