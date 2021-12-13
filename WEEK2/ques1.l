%option noyywrap
%{
	#include<stdio.h>
	int k = 0, i = 0, n = 0, un = 0;
	int w = 0, as = 0, os = 0, sc = 0;
%}

%%

if|else|while|int|switch|for|char|then|float|real k++;
[a-z]([a-z[0-9])* i++;
[0-9]* n++;
[0-9]+(.[0-9]+)?(E[+|-]?[0-9])? un++;
[\t\n]+ w++;
:= as++;
"+"|"-"|"*"|"/" os++;
"!"|"@"|"#"|"$"|"%"|"^"|"&"|"("|")" sc++;
.* {printf("Invalid");}

%%
int main()
{
	yylex();
	printf("Keywords: %d\nIdentifiers: %d\n", k, i);
	printf("Numbers: %d\nUnsigned Numbers: %d\n", n, un);
	printf("Whitespaces: %d\n", w);
	printf("Assignment Operators: %d\n", as);
	printf("Operator Symbols: %d\n", os);
	printf("Special Characters: %d\n", sc);
	return 0;
}