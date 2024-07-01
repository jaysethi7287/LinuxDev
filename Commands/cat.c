#include<stdio.h>
#include<string.h>

int main(int argc, char * argv[]) {
    
    // file pointer
    FILE * fp;

    // get file from stdin
    fp = fopen(argv[1], "r");

    if (!fp) {
        printf("Error in accessing file\n");
        return 1;
    }

    // start parsing
    char c = fgetc(fp);
    while (c != EOF) {
        printf("%c", c);
        c = fgetc(fp);
    }

    // close file
    fclose(fp);
}