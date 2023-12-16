%{
    #include "y.tab.h"
%}

%%
[0-9]+ {yylval.val = atoi(yytext); return ID;}
[+-*/()] {return yytext[0];}
%%

int yywrap(void){return 0;}