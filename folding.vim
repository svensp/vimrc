set foldtext=GetFoldedHeader()
function! MyFoldText()
  let nucolwidth = &fdc + &number*&numberwidth
  let winwd = winwidth(0) - nucolwidth - 5
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let prefix = " _______>>> "
  let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
  let fillcharcount = winwd - len(line) - len(fdnfo)
  return line . repeat(" ",fillcharcount) . fdnfo
endfunction

" Thanks to Edouard at http://vim.wikia.com/wiki/Customize_text_for_closed_folds
function! GetFoldedHeader()
  let numlines_folded = v:foldend - v:foldstart + 1
  let line_num = v:foldstart
  let firstline = getline(v:foldstart)

  let charline = matchstr(firstline, '^\s*\(<[^!]\|\w\+\)[^{}]*')

  " Handle javadoc style comments, display the javadoc summary as the foldtext
  if match(firstline, '^\s*\/\*\*') == 0
    if match(firstline, '^\s*\/\*\*\s*$') == 0
      let charline = substitute(getline(v:foldstart+1), '^\s*\**\s*', '(doc) ', '')
      let charline = substitute(charline, '\..*$', '.', '')
    else
      let charline = substitute(firstline, '\s*\/\*\*\s*', '', '')
    endif
  else
    " handle the special case of multiple single line comments
    if match(firstline, '^\s*\/\/') == 0
      if match(getline(v:foldend), '^\s*\/\/') == 0
        let charline = substitute(firstline, '\s*\/*\s*', '', '')
      endif
    else
      let charline = matchstr(firstline, '^\s*\(<[^!]\|\w\+\)[^{}]*')
      while strlen(charline) == 0 && line_num < v:foldend
        let line_num = line_num + 1
        let charline = matchstr(getline(line_num), '^\s*\(<[^!]\|\w\+\)[^{}]*')
      endw
    endif
  endif

  "let preamble = printf("[%d lines folded]:", numlines_folded)
  "return printf("%-20s%s", preamble, substitute(charline, '^\s*', '', ''))
  return printf("%s", substitute(charline, '^\s*', '', ''))
endfunction
