%{
    #include <stdio.h>
    #include <string.h>
%}


%%
void|return|continue|break|int {printf("%s is a keyword \n", yytext);}
[+-/=*%] {printf("%s is an operator\n", yytext);}
([a-zA-Z][0-9])+|[a-zA-Z]* {printf("%s is an identifier\n", yytext);}
[{};,()] {printf("%s is a separator\n", yytext);}
%%

int yywrap(void){return 1;}
int main()
{
    yylex();
    return 0;
}