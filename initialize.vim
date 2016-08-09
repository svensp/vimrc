" Function / Macro to write all parameters given to a constructor to its
" attributes
:function! Initialize()
	normal mz
	let s:constructor_line=line(".")
	let @b=expand("<cword>")
	let s:targetName="_".@b

	execute 's/'.@b.'/'.s:targetName.'/Ie'
	:let @b="\t".@b."( ".s:targetName." )"
	" Add " :" to the end of the line if it is not there yet
	:s/\(^.*)\)\s*\({\s*\)$/\1\r\2/e
	normal g`z
	:s/\(^.*)\)\s*\(:\s*\)\=$/\1 :/e
	normal g`z

	call search("{")
	:put! b
	normal k
	if line(".") != s:constructor_line
		:s/^\(.*$\)/\1,/e
	endif
	normal g`z
:endfunction

command! Initialize call Initialize()
