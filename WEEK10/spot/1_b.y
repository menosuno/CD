%{
 #include<stdio.h>
 #include<ctype.h>
 int yylex();
 int yyerror();
%}
%token DIGIT
%left '+''-'
%left '*''/'
%%
line : expression '\n' {printf("answer = %d\n\n",(int)$$); return 0;}
 ;
expression : expression expression '+' {$$ = $1 + $2;}
 | expression expression '-' {$$ = $1 - $2;}
 | expression expression '*' {$$ = $1 * $2;}
 | expression expression '/' {$$ = $1 / $2;}
 | '(' expression ')' {$$ = $2;}
 | DIGIT {$$ = $1;}
 ;
%%
int main() {
 yyparse();
}
int yyerror() {
printf("Invalid expression!\n\n");
return 1;
}