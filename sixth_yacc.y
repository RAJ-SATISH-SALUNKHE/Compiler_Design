%{
    #include <stdio.h>
    void yyerror(char *s);
%}

%token PRONOUN NOUN VERB ARTICLE
%start S

%%
S:pron verb art noun {printf("The given sentence is gramatically correct\n");}
;
pron:PRONOUN
;
verb:VERB
;
noun:NOUN
;
art:ARTICLE
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