%option noyywrap
%{
 #include<stdio.h>
 #include<stdlib.h>
 #include"y.tab.h"

%}
%%
[0-9]+ {
 yylval = yytext[0]-'0';
 return (DIGIT);
}
"+"|"-"|"*"|"/"|"("|")"|"\n" {
 return yytext[0];
}
. {
}
%%