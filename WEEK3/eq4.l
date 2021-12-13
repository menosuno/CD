%option noyywrap
%{
	#include<stdio.h>
%}

%%
^b*(a(b?a)*b?)?$ {printf("String %s doesnt contain abb..\n",yytext);}
.* {printf("Doesn't satisfy the given condition..\n");}
%%
int main()
{
	yylex();
	return 0;
}