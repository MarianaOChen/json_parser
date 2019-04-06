/*Laboratório 3 - Parsen JSON main.y

Aluna: MARIANA ONOFRE CHEN RA:156628

Ultima altualização: 05/04/2019

*/

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}


%token NUMBER STRING COLON OB FB OBRACE CBRACE COMMA

%%

DOC:
	OBJECT DOC { printf("VALIDO\n");}
        |
        ;


OBJECT:
	OBRACE CONT_OBJ CBRACE //{printf("OBJETO\n");}
	;

CONT_OBJ:
	STRING COLON VALUE //{printf("STRIN: VALUE\n");}
	|CONT_OBJ COMMA CONT_OBJ //{printf("CONT , CONT\n");}
	|OBJECT// {printf("OBJ CONT_OBJ\n");}
	|
	;
    	
VALUE:
	STRING  //{printf("String\n");}
	|NUMBER// {printf("NUMBER\n");}
	|OBJECT// {printf("VALUE_OBJECT\n");}
	|LISTA // {printf("LISTA\n");}
 	;
LISTA:
	OB CONTEUDO FB// {printf("Lista\n");}
	|OB FB
	;

CONTEUDO:
	VALUE // {printf("CONTUDO_VALUE\n");}
	|VALUE COMMA CONTEUDO //{printf("VALUE , CONTEU\n");}
	;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
  //fprintf(stderr, "%s\n", s);
	
}


int main() {
  yyparse();
//printf("FIM\n");
    return 0;
}
