/*Laboratório 3 - Parser JSON main.l

Aluna: MARIANA ONOFRE CHEN RA: 156628
Ultima alteração: 05/04/2019

*/

%{
#include <stdlib.h>
#include <string.h>

void yyerror(char *);

#include "y.tab.h"

%}
/*Expressões Regulares*/

%%

[-]?([0-9]+[.])?[0-9]+  {
          yylval = atoi(yytext);
          return NUMBER;
        }

[\[]	{return OB;}

[\]]	{return FB;}

[{]	{return OBRACE; }//printf("OBRACE\n");}
 
[}]	{return CBRACE; }//printf("CBRACE\n");}

\n ;	//{printf("EOL\n");}

[:]	{return COLON;}// printf("COLON\n");}

[,] 	{return COMMA;}


[ \t]+ ;//{printf("ESPAÇO\n");}


[\"][a-z A-Z 0-9]+[\"] {return STRING;}//printf("oistring\n");}

.   ;

%%

int yywrap() {
  return 1;
}
