%option noyywrap

%{ 
	#include<stdio.h>
	#include "y.tab.c"
%}

%%
[0-9]+ {
		yylval = yytext[0];
		return 0;
	}
"+"|"-"|"*"|"/" {return yytext[0];} 
. return 0;
%%
