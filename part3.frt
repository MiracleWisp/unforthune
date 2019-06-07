: IMMEDIATE last_word @ cfa 1 - dup c@ 1 or swap c! ;

: if ' 0branch , here_adv 0 , ; IMMEDIATE
: else ' branch , here_adv 0 , swap here_adv swap ! ; IMMEDIATE
: then here_adv swap ! ; IMMEDIATE

: repeat
 here_adv
; IMMEDIATE

: until
 ' 0branch , ,
; IMMEDIATE

: dup_pair >r dup r> swap >r dup r> swap ;

: for
  ' swap , ' >r , ' >r ,
  here_adv ' r> , ' r> ,
  ' dup_pair , ' >r , ' >r , ' < ,
  ' 0branch ,
  here_adv 0 , swap
; IMMEDIATE

: endfor
  ' r> , ' lit , 1 , ' + , ' >r ,
  ' branch , , here_adv swap ! ' r> ,
  ' drop , ' r> , ' drop ,
; IMMEDIATE

: rot >r swap r> swap ;

: sq dup * ;

: -rot swap >r swap  r> ;
