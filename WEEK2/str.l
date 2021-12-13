%option noyywrap
%{
    #include<stdio.h>
    int valid=0;
%}

%%
([a-zA-z0-9._]+@[a-z]+)((".com")|(".in")) {valid=1;}
\n return 0;
%%

int main() 
{
    yylex();
    if(valid)
    printf("\nValid mail id\n");
    else
    printf("\nInvalid mail id\n");
}