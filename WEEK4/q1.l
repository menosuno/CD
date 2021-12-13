%option noyywrap
%{
	#include<stdio.h>
	int i;
%}

%%
[\n]+ ;
.* { for (i=yyleng-1; i>=0; i--)
	printf("%c", yytext[i]); 
	printf("\n"); }
%%
int main()
{
	extern FILE *yyin;
	yyin = fopen("Input.txt","r");
	yylex();
	return 0;
}