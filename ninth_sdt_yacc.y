%{
    #include <stdio.h>
%}

%token ID
%start E
%union {int val;}

%%
E:E'+'T {$$ = $<int>1 + $3; printf("%d", $$);}
 |E'-'T {$$ = $1 + $3;}
 |T
 ;
T:T'*'F {$$ = $1 * $3;}
 |T'/'F {$$ = $1 / $3;}
 |F
 ;
F:'('E')' {$$ = $2;}
 |ID
 ;
%%

int main()
{
    yyparse();
    return 0;
}