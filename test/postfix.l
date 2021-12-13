%option noyywrap

%{
	#include<stdio.h>
	#include <stdlib.h>
	int yylval;
%}

%%
[0-9]+ { yylval = yytext[0]-'0';
	return NUM;
	}
"+"|"-"|"*"|"/"|"("|")"|"\n" {
return yytext[0];}
. {}
%%

