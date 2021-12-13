%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-z]+	{
fprintf(yyout,"\n Lower=");ECHO;
yyless(4);
fprintf(yyout,"\nThe word after yyless()=");ECHO;
}
[a-zA-Z]+	{
fprintf(yyout,"\nMixed letter is=");ECHO;
}
%%

int main()
{
	extern FILE *yyin,*yyout;
	yyin=fopen("file4.txt","r");
	yyout=fopen("output4.txt","w");
	yylex();
	return 0;
}