scriptencoding utf-8

function! zencoding#lorem#ja#expand(command)
  let wcount = matchstr(a:command, '^\%(lorem\|lipsum\)\(\d*\)}$', '\1', '')
  let wcount = wcount > 0 ? wcount : 30

  let url = "http://www.aozora.gr.jp/cards/000081/files/470_15407.html"
  let content = zencoding#util#cache(url)
  if len(content) == 0
    let content = zencoding#util#getContentFromURL(url)
    let content = matchstr(content, '<div[^>]*>\zs.\{-}</div>')
    let content = substitute(content, '[　\r]', '', 'g')
    let content = substitute(content, '<br[^>]*>', "\n", 'g')
    let content = substitute(content, '<[^>]\+>', '', 'g')
    let content = join(filter(split(content, "\n"), 'len(v:val)>0'), "\n")
    call zencoding#util#cache(url, content)
  endif
  
  let content = substitute(content, "、\n", "、", "g")
  let clines = split(content, '\n')
  let lines = filter(clines, 'len(substitute(v:val,".",".","g"))<=wcount')
  if len(lines) == 0
    let lines = clines
  endif
  let r = zencoding#util#rand()
  return lines[r % len(lines)]
endfunction
