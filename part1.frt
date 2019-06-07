: chp dup 3 < if drop 1 else
    2 >r
    repeat
        dup r@ sq swap dup rot dup -rot swap < -rot swap = or
        if 
            dup r@ sq % not
            if 
                drop 0 1
            else 
                r> 1 + >r 0  
            then
        else
            drop 1 1
        then
    until 
    r> drop then ; 

: concat 
	over count over count 1 + + ( count final length ) 
	heap-alloc dup >r 
	rot 
	dup count >r ( save str1 len)
	dup >r ( save str1 addr ) 
	string-copy
	r> heap-free ( free str1 )
	r> r@ + swap 
	dup >r ( save str2 addr)
	string-copy 
	r> heap-free ( free str2 )
	r> prints ;

: even 2 % not ;

: prime dup 2 < if drop 0 else 
      1 repeat 
            swap dup rot 1 + dup -rot % not 
        until = ;

: prime_allot 
    prime 
    1 allot
    dup -rot 
    ! ;
