%option noyywrap
%{
#include<stdio.h>
#include"y.tab.h"
%}

%%
[a-z]+ {return VA;}
"+" {return PLUS;}
\) {return CLOSE;}
\( {return OPEN;}
[\n] return 0;
. {return 0;}
%%
