%{
    #include <stdio.h>
    #include <string.h>
    typedef struct Table
    {
        char word[50];
    }table;

    table header, keyword, operator, identifier, number, separator, floating;
    int i=0, j=0, k=0, l=0, m=0, n=0, o=0;
    int a;
%}

HEADER_FILE <[a-zA-Z_][a-zA-Z0-9_]*.h>

%%
#include{HEADER_FILE} {strcpy(header.word[i], yytext); i++;}
void|return|continue|break|int {strcpy(keyword.word[i], yytext); j++;}
[+-/=*%]+ {strcpy(operator.word[k], yytext); k++;}
([a-zA-Z][0-9])+|[a-zA-Z]* {strcpy(identifier.word[l], yytext); l++;}
[0-9]+ {strcpy(number.word[m], yytext); m++;}
[{};,()] {strcpy(separator.word[n], yytext); n++;}
[0-9]+[.][0-9]+ {strcpy(floating.word[o], yytext); o++;}
%%

int yywrap(void){return 1;}
int main()
{
    yyin = fopen("input_fifth.c", "r");
    yyout = fopen("output_fifth.txt", "w");
    while(!feof(yyin))
    {
        yylex();
    }
    fprintf(yyout, "Headers\n");
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", header.word[a]);
    }
    return 0;
}