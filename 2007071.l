%{
#include <stdio.h>

int keyword = 0;
int identifier = 0;
int number = 0;
int operator = 0;
FILE *outputFile;
%}

%option noyywrap
               
LOOP insanity
BREAK ragequit
END gameover
IF lemmeCheck
THEN hmm
ELSE nah
PRINT bruhSays
VARIABLE bruh
RETURN bounceBack
FUNCTION duty

IDENTIFIER [a-zA-Z_][a-zA-Z_0-9]*
NUMBER [0-9]+
OPERATOR [+\-*/=<>!]+
WHITESPACE [ \t\n]+

%%

\"[^\"]*\"  { }
insanity       { keyword++; }
ragequit       { keyword++; }
gameover       { keyword++; }
lemmeCheck     { keyword++; }
hmm            { keyword++; }
nah            { keyword++; }
bruhSays       { keyword++; }
bruh           { keyword++; }
bounceBack     { keyword++; }
duty           { keyword++; }

{IDENTIFIER}   { identifier++; }
{NUMBER}       { number++; }
{OPERATOR}     { operator++; }

{WHITESPACE}   { }

. {}

%%

int main() {
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    if (!yyin) {
        fprintf(stderr, "Error opening input file\n");
        return 1;
    }

    if (!yyout) {
        fprintf(stderr, "Error opening output file\n");
        return 1;
    }

    yylex();

    printf("Keywords: %d\n", keyword);
    printf("Identifiers: %d\n", identifier);
    printf("Numbers: %d\n", number);
    printf("Operators: %d\n", operator);

    fprintf(yyout, "Keywords: %d\n", keyword);
    fprintf(yyout, "Identifiers: %d\n", identifier);
    fprintf(yyout, "Numbers: %d\n", number);
    fprintf(yyout, "Operators: %d\n", operator);

    fclose(yyin);
    fclose(yyout);

    return 0;
}

