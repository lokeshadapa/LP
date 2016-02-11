%{
#include <stdlib.h>
#include <stdio.h>
%}

%%
auto|break |case|char|const|continue|do|double|else|enum|extern|float |
for|goto|if|int|long|register|return|short|signed|sizeof|static|struct |
switch|typedef|union|unsigned|void|volatile|while|printf|scanf  printf("%s \t KEYWORD\n",yytext);
[ \t\n] ;
[a-zA-Z][a-zA-Z0-9]*    printf("%s \t IDENTIFIER \n",yytext);
[0-9]+[a-zA-Z]+  printf("%s \t ERROR TOKEN \n",yytext);
[-]?[0-9]+([e][+/-][0-9]+)?     printf("%s \t NUMBER \n",yytext);
[<>!](=)?       printf("%s \t RELATIONAL OP\n",yytext);
==      printf("%s \t RELATIONAL OP\n",yytext);
=       printf("%s \t ASSIGNMENT OP\n",yytext);
[+\-*/](=)? printf("%s \t ARTHEMATIC OPERATOR \n",yytext);
[{(})]  printf("%s \t PARENTESIS \n",yytext);
"\\"(.)*$       printf("%s \t comment \n",yytext);
"\*"(.)*"\*"$   printf("%s \t comments \n",yytext);
[,;] printf("%s \t comma \n",yytext);
['"] printf("%s \t quotes \n",yytext);
[&^\|]|("&""&")|("|""|")        printf("%s \t LOGICAL OP \n",yytext);
. ECHO;
%%
int main(int argc,char **argv)
{
        FILE *fp;
        fp=fopen("input.txt","r");
        yyin=fp;
        yylex();
        fclose(yyin);
        yywrap();
        return 0;
}
