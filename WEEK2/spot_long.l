%option noyywrap
%{
int counter = 0;
%}
 
%%
[a-zA-Z]+ {
if(yyleng > counter) {
counter = yyleng;
}
}
%%
int main()
{
yylex();
printf("Longest word length: %d",counter);
printf("\n");
return 0;
}