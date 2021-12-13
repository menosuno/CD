%option noyywrap
%{
    #include<stdio.h>
    int k = 0;
    int i = 0;
    int u = 0;
    int w = 0;
    int a = 0;
    int o = 0;
    int s = 0;
    int n = 0;
    int num=0;
%}

%%
if|else|while|int|then|float|real { 
        printf("\n%s : Keyword",yytext);
        k++;
        n++;
    }
[a-zA-Z_][a-zA-Z0-9_]* { 
        printf("\n%s : Identifier",yytext); 
        i++; 
        n++;
    }
[0-9]* { 
        printf("\n%s : Number",yytext); 
        num++; 
        n++;
    }
[0-9]+(.[0-9]+)?(E[+|-]?[0-9])? { 
        printf("\n%s : Unsigned number",yytext); 
        u++;
        n++;
    }
=  { 
        printf("\n%s : Assignment operator",yytext); 
        a++; 
        n++;
    }
[+-/*] { 
        printf("\n%s : Operator",yytext); 
        o++; 
        n++;
    }
"!"|"@"|"#"|"$"|"%"|"%"|"^"|"&"|"*"|"("|")" { 
        printf("\n%s : Special character",yytext); 
        s++; 
        n++;
    }
[ \t\n] { 
        printf("\n%s : White space",yytext); 
        w++; 
        n++;
    }
.;
%%

int main()
{
    yylex();


    printf("\n\nCOUNT\n keywords: %d\n", k);
    printf("numbers: %d\n",num);
    printf("identifiers: %d\n", i);
    printf("unsigned numbers: %d\n", u);
    printf("operators: %d\n", o);
    printf("assignment operators: %d\n", a);
    printf("special characters: %d\n", s);
    printf("white spaces: %d\n", w);
    printf("total count: %d\n", n);

    return 0;
}