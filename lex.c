#include <stdio.h>
#include <string.h>

void replaceABC(char *str) {
    int len = strlen(str);
    for(int i = 0; i < len - 2; i++) {
        if(str[i] == 'a' && str[i+1] == 'b' && str[i+2] == 'c') {
            str[i] = 'A';
            str[i+1] = 'B';
            str[i+2] = 'C';
        }
    }
}

int main() {
    char input[100];

    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove newline character if present
    input[strcspn(input, "\n")] = 0;

    replaceABC(input);

    printf("Modified string: %s\n", input);

    return 0;
}
