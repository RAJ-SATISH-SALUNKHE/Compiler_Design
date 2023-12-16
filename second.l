%{
#include <stdio.h>
int nchar, nword, nline;
%}
%% [
[\n]+ {nline++; nchar+=yyleng;}
[^\t\n]+ {nword++; nchar+=yyleng;}
. {nchar++;}
%%
int yywrap(void){return 1;}
int main()
{
    yylex();
    printf("%d\t%d\t%d\t", nchar, nword, nline);
    return 0;
}