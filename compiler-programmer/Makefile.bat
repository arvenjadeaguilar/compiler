bison -dy compiler.y
flex compiler.l
cc lex.yy.c y_tab.c
