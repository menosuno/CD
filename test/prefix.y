%{
	#include<stdio.h>
	#include<ctype.h>
	int yylex();
	int yyerror();
%}
%token NUM
%left '+''-'
%left '*''/'
%%
line:expr'\n' {printf("EVALUTE :%d\n",(int)$$);return 0;};
expr:'+' expr expr {$$=$2+$3;}
|'-' expr expr {$$=$2-$3;}
|'*' expr expr {$$=$2*$3;}
|'/' expr expr {$$=$2/$3;}
|'('expr')' {$$=$2;}
|NUM {$$=$1;}
;
%%
#include "lex.yy.c"

int main()
{
	printf("enter expression:");
	yyparse();
	printf("valid\n");

}
int yyerror()
{
printf("Invalid\n");
return 0;
}
