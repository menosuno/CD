%option noyywrap
%{
#include<stdio.h>
%}
%%

[^adfADF]	{printf("%s", yytext);}
.|\n		{;}
%% 
int main()
{ yyin = fopen("adf.txt","r");
printf("Required Strings:\n"); 
yylex();
printf("\n"); 
return 0; 
}
