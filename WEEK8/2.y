%{
        #include<stdio.h>
        #include<ctype.h>
        int yylex();
        int yyerror();
%}

%token DIGIT
%left '&''|'
%right '!'

%%

line : expression '\n' {printf("answer = %d\n\n",$$); return 0;}
     ;
expression : expression '&' '&' expression {$$ = $1 && $4;}
           | expression '|' '|' expression {$$ = $1 || $4;}
           | '!' expression {$$ = !$2;}
           | '(' expression ')' {$$ = $2;}
           | DIGIT      {$$ = $1;}
           ;
%%

#include "lex.yy.c"

int main() {
        
                yyparse();
		printf("valid\n");
}

int yyerror() {
	printf("not valid\n");
	return 0;
}
