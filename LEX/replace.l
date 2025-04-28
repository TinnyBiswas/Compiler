%{
#include <stdio.h>
#include <string.h>
%}
%%
[a-zA-Z]+ {  // This will match any sequence of letters
    char *match;
    char new_text[1024];  // Buffer for storing modified text
    int i = 0;
    // Copy yytext into the new_text buffer
    strcpy(new_text, yytext);
    // Replace all occurrences of "abc" with "ABC"
    while ((match = strstr(new_text, "abc")) != NULL) {
        // Replace "abc" with "ABC"
        strncpy(match, "ABC", 3); // Copy "ABC" into the position of "abc"
        // Continue scanning from the position after the replacement
        match += 3;
    }
    // Print the modified text
    printf("%s", new_text);
}
[\t\n]+  ;  // Ignore whitespace
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}