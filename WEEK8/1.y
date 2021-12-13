
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
line : expression {printf("answer = %d\n\n",(int)$$); return 0;}
;
expression : expression '+' expression {$$ = $1 + $3;}
	   | expression '-' expression {$$ = $1 -$3;}
	   | expression '*' expression {$$ = $1 * $3;}
	   | expression '/' expression {$$ = $1 / $3;}
	   | '(' expression ')' {$$ = $2;}
	   | DIGIT      {$$ = $1;}
;
%%

#include "lex.yy.c"
int main() {
	printf("\nEnter the expression: ");
	yyparse();
	printf("Valid expression\n");
}
int yyerror() {
	printf("\nInvalid expression");
	return 0;
}
