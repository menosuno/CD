%option noyywrap

%{
    #undef yywrap
    #define yywrap() 1
    int n = 0;
    int ln = 0;
%}

%%
if|else|while|int|switch|for|char { printf("%s: keywords\n", yytext);}
[a-zA-Z]([a-zA-Z0-9])* { printf("%s: identifier\n", yytext);}
[0-9]+ { printf("%s: numbers\n", yytext);}
([ ])|\n|\t { printf("%s: whitespace\n", yytext);}
"++" { printf("%s: increment\n", yytext);}
! | @|#\/ { printf("%s: special", yytext);}
= { printf("%s: assignment operator\n", yytext);}
"<" { printf("%s: greater than operator\n", yytext);}
">" { printf("%s: less than operator\n");}
%%

int main()
{
    yyin = fopen("file2.txt","r");
    yyout=fopen("output2.txt","w");
    yylex();
    return 0;
}