%{
#include <stdio.h>
#include "parser.tab.h"
%}

%%

[0-9]+   { yylval.dval = atof(yytext); return DIGIT; }
[+]      { return '+'; }   // Add this to handle the '+' symbol
\n       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
