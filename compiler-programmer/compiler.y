%token INTEGER VARIABLE DOUBLE
%token PRINT FUNC_NAME STRING IF ELSE
%left '+' '-'
%left '*' '/'

%{
	void yyerror(char *);
	int yylex(void);
	int sym[26];
	

%}

%%


program:
		program conditional '\n'
		|
		;

conditional:
		
		IF '(' expr '=' '=' expr ')' '{' statement '}' ELSE statement
										{if($3==$6) $9; else $12;}
		|statement
		;
		
statement:
		//expr							{printf("%d\n",$1);}
		 VARIABLE '=' expr 				{sym[$1]=$3;}
		|PRINT expr						{printf("%d\n",$2)}
		|PRINT '"' STRING '"'			{printf("%s",$3);}
		
		
		;
expr:
		INTEGER
		| VARIABLE						{$$ = sym[$1];}
		| expr '+' expr					{$$ = $1 + $3;}
		| expr '-' expr					{$$ = $1 - $3;}
		| expr '*' expr					{$$ = $1 * $3;}
		| expr '/' expr					{$$ = $1 / $3;}
		| '(' expr ')'					{$$ = $2;}
		 		
		;


%%


void yyerror(char *s)	{
	fprintf(stderr, "%s\n", s);
	
}

int main(void){

	yyparse();
	return 0;
}
