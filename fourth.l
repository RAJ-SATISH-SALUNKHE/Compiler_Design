%{
    #include <stdio.h>
    #include <string.h>
%}

HEADER_FILE <[a-zA-Z_][a-zA-Z0-9_]*.h>

%%
#include{HEADER_FILE} {fprintf(yyout, "%s is a header file\n", yytext);}
void|return|continue|break|int {fprintf(yyout, "%s is a keyword\n", yytext);}
[+-/=*%]+ {fprintf(yyout, "%s is an operator\n", yytext);}
([a-zA-Z][0-9])+|[a-zA-Z]* {fprintf(yyout, "%s is an identifier\n", yytext);}
[0-9]+ {fprintf(yyout, "%s is a number\n", yytext);}
[{};,()] {fprintf(yyout, "%s is a separator\n", yytext);}
[0-9]+[.][0-9]+ {fprintf(yyout, "%s is a floating point number\n", yytext);}
%%

int yywrap(void){return 1;}
int main()
{
    yyin = fopen("input_fourth.c", "r");
    yyout = fopen("output_fourth.txt", "w");
    while(!feof(yyin))
    {
        yylex();
    }
    return 0;
}