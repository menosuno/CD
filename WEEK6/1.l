%{
	char expr[100];
	int tos = 0;
	void push(char);
	void pop();
	char top();
	int priority(char c);
%}

%%

[a-zA-Z]?	{fprintf(yyout, "%c", yytext[0]);}
[+\-*\/\(\)^]	{
	char op = yytext[0];
	if(tos == 0 || op =='(')
		push(op);
	else if(op == ')'){
		while(top() != '('){
			fprintf(yyout, "%c", top());
			pop();
		}
		pop();
	}
	else if(priority(op) >= priority(top())){
		push(op);
	}
	else if(priority(op) <= priority(top())){
		while(priority(op) <= priority(top())){
			fprintf(yyout, "%c", top());
			pop();
		}
		push(op);
	}
}
[\n]	{
	int i;
	for(i = tos-1; i >= 0; i--)
	if(expr[i] != '(' && expr[i] != ')'){
		fprintf(yyout, "%c", expr[i]);
	}
	fprintf(yyout, "\n");
	tos = 0;
	return 0;
}

%%

int yywrap(){};
int main(){
	FILE* fp = fopen("epostinp1.txt","r");
	if(fp)
	yyin=fp;
	yyout=fopen("epostout1.txt","w");
	yylex();
	printf("Output in file\n");
	return 0;
}
void pop(){
	tos--;
}
char top(){
	return expr[tos-1];
}
void push(char c){
	expr[tos] = c;
	tos++;
}
int priority(char c){
	if(c == '(' || c == ')'){
		return 0;
	}
	else if( c == '+' || c == '-'){
		return 1;
	}
	else if(c == '*' || c == '/'){
		return 2;
	}
	else{
		return -1;
	}
}