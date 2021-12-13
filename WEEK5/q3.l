%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
%}
%%
[A-Z]+	{fprintf(yyout,"\nUpper Case: ");ECHO;yymore();}
[a-z]+	{fprintf(yyout,"\nLower Case: ");ECHO;yymore();}
[ \n]+	{fprintf(yyout,"\nWord:%s",yytext);}
%%
int main()
{
	yyin = fopen("file3.txt","r");
	yyout = fopen("output3.txt","w");
	yylex();
	printf("Written in answer file..\n");
	return 0;
}