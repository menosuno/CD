%{
#include<stdio.h>
int yylex();
int yyerror();
int f=0;
%}

%token PLUS VA CLOSE OPEN
%left '+'

%%
line:OPEN N CLOSE {printf("correct");};

N:VA PLUS VA {printf("Valid\n");}
;

%%

void main(){
	printf("Enter the Expression :");
	yyparse();
	if(f==0)
		printf("Correct\n");
}

int yyerror(){;}

