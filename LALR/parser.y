%{
#include <stdio.h>
void yyerror(char *s);
int yylex(void);
%}

%union {
    double dval;
}

%token <dval> DIGIT
%type <dval> expr term factor

%%

line: expr '\n' { printf("%g\n", $1); }
    ;

expr: expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }
    | term { $$ = $1; }
    ;

term: term '*' factor { $$ = $1 * $3; }
    | term '/' factor { 
          if ($3 == 0) {
              yyerror("Division by zero!");
              YYABORT;
          } else {
              $$ = $1 / $3;
          }
      }
    | factor
    ;

factor: '(' expr ')' { $$ = $2; }
      | DIGIT { $$ = $1; }
    ;

%%

int main() {
    printf("Enter AE:\n");
    yyparse();
    return 0;
}

void yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
}
