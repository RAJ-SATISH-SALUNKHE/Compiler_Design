%{
    #include "y.tab.h"
%}

%%
he|she|it|they {printf("%s is a pronoun\n", yytext); return PRONOUN;}
is|not {printf("%s is a verb\n", yytext); return VERB;}
a|the {printf("%s is a article\n", yytext); return ARTICLE;}
boy|girl {printf("%s is a noun\n", yytext); return NOUN;}
handsome|hardworking|intelligent {printf("%s is a adjective\n", yytext); return ADJECTIVE;}
but|or|and|nor {printf("%s is a conjuction\n", yytext); return CONJUNCTION;}
%%

int yywrap(void){return 0;}