%{
#include <stdio.h>
#include "parser.tab.h"
#include <stdlib.h>  // for atof()
%}

%%

[0-9]+(\.[0-9]+)?   { yylval.dval = atof(yytext); return DIGIT; }
[+]                 { return '+'; }
[-]                 { return '-'; }
[*]                 { return '*'; }
[/]                 { return '/'; }
[(]                 { return '('; }
[)]                 { return ')'; }
\n                  { return yytext[0]; }
[ \t]               ;  // Ignore spaces and tabs

%%

int yywrap() {
    return 1;
}
