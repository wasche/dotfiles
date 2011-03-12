if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.vm setfiletype velocity
  au! BufRead,BufNewFile *.xsl.m4 setfiletype xsltm4
  au! BufRead,BufNewFile *.haml setfiletype haml
  au! BufRead,BufNewFile *.sass setfiletype sass
  au! BufRead,BufNewFile *.rake setfiletype ruby
  au! BufRead,BufNewFile *.proto setfiletype proto
  au! BufRead,BufNewFile Gemfile setfiletype ruby
augroup END
