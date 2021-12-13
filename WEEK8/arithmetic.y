%{
	#include<stdio.h>
	#include"y.tab.c"
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%%
E:T {printf("\nresult:%d\n",$$);

%%
