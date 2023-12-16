%{
    #include "y.tab.h"
%}

%%
he|she|it|they {printf("%s is a pronoun\n", yytext); return PRONOUN;}
is {printf("%s is a verb\n", yytext); return VERB;}
a|the {printf("%s is a article\n", yytext); return ARTICLE;}
boy|girl {printf("%s is a noun\n", yytext); return NOUN;}
%%

int yywrap(void){return 0;}