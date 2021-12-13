%option noyywrap

%{
	#include<stdio.h>
	#include<string.h>
%}

%%
[+] { fprintf(yyout,"||"); }
[*] { fprintf(yyout,"&&"); }
[a-z]  { fprintf(yyout,yytext); }
\n { fprintf(yyout,"\n"); } ;
%%

int main()
{
	extern FILE *yyin,*yyout;
	yyin = fopen("einp2.txt","r");
	yyout = fopen("eout2.txt","w");
	yylex();
	printf("\nOUTPUT WRITTEN TO THE FILE 'out2.txt' !\n");
	return 0;
}