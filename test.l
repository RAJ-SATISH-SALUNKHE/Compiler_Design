%{
#include <stdio.h>
#include <string.h>

#define MAX_WORDS 10

typedef struct Table
{
    char word[20];
}table;

table header[MAX_WORDS], keyword[MAX_WORDS], operator[MAX_WORDS], identifier[MAX_WORDS], number[MAX_WORDS], separator[MAX_WORDS], floating[MAX_WORDS];

int i = 0, j = 0, k = 0, l = 0, m = 0, n = 0, o = 0;

int a;

%}

HEADER_FILE <[a-zA-Z_][a-zA-Z0-9_]*.h>

%%
#include{HEADER_FILE} {strncpy(header[i].word, yytext, sizeof(header[i].word) - 1); i++;}
void|return|continue|break|int {strncpy(keyword[j].word, yytext, sizeof(keyword[j].word) - 1); j++;}
[+-/=*%]+ {strncpy(operator[k].word, yytext, sizeof(operator[k].word) - 1); k++; }
([a-zA-Z][0-9])+|[a-zA-Z]* {strncpy(identifier[l].word, yytext, sizeof(identifier[l].word) - 1); l++;}
[0-9]+ {strncpy(number[m].word, yytext, sizeof(number[m].word) - 1); m++;}
[{};,()] {strncpy(separator[n].word, yytext, sizeof(separator[n].word) - 1); n++;}
[0-9]+[.][0-9]+ {strncpy(floating[o].word, yytext, sizeof(floating[o].word) - 1); o++;}
%%

int yywrap(void){return 1;}

int main() {
    yyin = fopen("input_fifth.c", "r");
    yyout = fopen("output_fifth.txt", "w");
    while(!feof(yyin))
    {
        yylex();
    }
    fprintf(yyout, "Headers\n");
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", header[a].word);
    }
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", keyword[a].word);
    }
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", operator[a].word);
    }
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", identifier[a].word);
    }
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", number[a].word);
    }
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", separator[a].word);
    }
    for(a=0; a<50; a++)
    {
        fprintf(yyout, "%s\n", floating[a].word);
    }
    return 0;
}
