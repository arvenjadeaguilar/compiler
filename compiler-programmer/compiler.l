%{

#include<string.h>

#include <stdlib.h>
 void yyerror(char *);
#include "y_tab.h"


%}

%%


[a-z] {
		yylval = *yytext - 'a';
		return VARIABLE;


	}

"if"	{
		return IF;
		
		}
"else"	{
		return ELSE;
		}
"print" {
		return PRINT;
	}
	
[0-9]+	{
		yylval = atoi(yytext);
		return INTEGER;

	}
[a-z]+ {
			yylval = *yytext;
			return STRING;

		}
	
[-+/*()=\n{}]	{
		return *yytext;
	}

[ \t]	;
.		yyerror("invalid character");




%%



int yywrap(void){
		return 1;
}

