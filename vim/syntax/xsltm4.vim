" Vim syntax file
" Language:	XSLT and M4
" Maintainer:	Will Asche <kurakin@wickedspiral.com>
" URL:		http://www.fleiner.com/vim/syntax/htmlm4.vim
" Last Change:	2006 Aug 15

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" we define it here so that included files can test for it
if !exists("main_syntax")
  let main_syntax='xsltm4'
endif

if version < 600
  so <sfile>:p:h/xslt.vim
else
  runtime! syntax/xslt.vim
endif
unlet b:current_syntax
syn case match

if version < 600
  so <sfile>:p:h/m4.vim
else
  runtime! syntax/m4.vim
endif
unlet b:current_syntax
syn cluster xslTagHook add=@m4Top
syn cluster m4StringContents add=xslElement

let b:current_syntax = "xsltm4"

if main_syntax == 'xsltm4'
  unlet main_syntax
endif
