%{                                                                                                                                                   
 #include<stdio.h>                                                                                                                            
 #include<string.h>                                                                                                                           

char name[100], argu[100], body[100], datat[100];                                                                                     
int flag=0, flag1=0, tmp=1, p = 0;                                                                                
%}                                                                                                                                                

%%                                                                                                                                                   
#define[  ]* tmp=0;

[A-Za-z0-9]+\( {                                                                                                                                     
        if(flag==0)                                                                                                                                
                strcat(name,yytext);                                                                                                               
}                                                                                                                                                    
                                                                                                                                                     
[a-zA-Z,]*\) {                                                                                                                                              
        if(flag==0){                                                                                                                               
                if(flag1==0)                                                                                                                        
                        strcat(argu,yytext);                                                                                                         
                else                                                                                                                                 
                        strcat(body,yytext);	
		flag1=1;
	}	                                                                                                                                                    
}                                                                                                                                                                                                                                                                                                         
\n {                                                                                                                                                               
        int i=0;
        flag = 1;

	if(p == 1){              
        	printf("%s %s %s ",datat,name, datat);                                                                                                                                                                                                                                                                                                     
		for(i=0;argu[i]!=')';i++){                                                                                                                    
                	if(argu[i] == ',')                                                                                                                 
                	        printf(",%s ",datat);                                                                                                        
               		else                                                                                                                                
                	        printf("%c",argu[i]);                                                                                                        
        	}                                                                                                                                            
        	printf("){\n return %s;\n}\n",body);
	}
	p=1;                                                                                                                                                                                                                                                                
        return 0;                                                                                                                                
}                                                                                                                                                    
                                                                                                                                                     
[A-Za-z ]+= {                                                                                                                        
        int i;       
	strcat(datat,yytext);                                                                                                                               
        for(i=0;datat[i]!=' ';i++)
              ;                                                                                                                  
        datat[i]='\0';                                                                                                                                
}                                                                                                                                                    
                                                                                                                                                     
. if(flag==0) strcat(body,yytext);                                                                                                                                      
%%                                                                                                                                                   
                                                                                                                                                     
                                                                                                                                                     
int yywrap(void){}                                                                                                                                   
                                                                                                                                                     
int main(){                                                                                                                                          
        printf("Enter macro\n");                                                                                                      
        yylex(); 
	printf("Enter calling func\n");
	yylex();                                                                                                                                                                                                                                     
        return 0;                                                                                                                                    
}