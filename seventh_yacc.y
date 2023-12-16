%{
    #include <stdio.h>
    void yyerror(char *s);
%}

%token PRONOUN NOUN VERB ARTICLE CONJUNCTION ADVERB ADJECTIVE
%start S

%%
S:simple conjunction simple {printf("The given sentence is a compound sentence\n");}
;
conjunction:CONJUNCTION
;
simple:pron verb art noun verb adj|pron verb adj|verb adj {printf("The given sentence is a simple sentence\n");}
;
pron:PRONOUN
;
verb:VERB
;
art:ARTICLE
;
noun:NOUN
;
adj:ADJECTIVE
;
%%

int main()
{
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    printf("\n%s\n", s);
}