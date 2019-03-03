%{
//Partie 1
#include<stdlib.h>
#include<stdio.h>
//%token YYDEBUG 1
//#include"syntabs.h" // pour syntaxe abstraite
//extern n_prog *n;   // pour syntaxe abstraite
extern FILE *yyin;    // declare dans compilo
extern int yylineno;  // declare dans analyseur lexical
int yylex();          // declare dans analyseur lexical
int yyerror(char *s); // declare ci-dessous
%}


//Partie 2
//TODO: compléter avec la liste des terminaux
%token SI
%token POINT_VIRGULE
%token PLUS 
%token MOINS 
%token FOIS 
%token DIVISE 
%token PARENTHESE_OUVRANTE 
%token PARENTHESE_FERMANTE 
%token CROCHET_OUVRANT 
%token CROCHET_FERMANT 
%token ACCOLADE_OUVRANTE 
%token ACCOLADE_FERMANTE 
%token EGAL 
%token INFERIEUR 
%token ET 
%token OU 
%token NON 
%token ALORS 
%token SINON 
%token TANTQUE 
%token FAIRE 
%token ENTIER 
%token RETOUR 
%token LIRE 
%token ECRIRE 
%token IDENTIF 
%token NOMBRE 
%token VIRGULE
%start expression
%%


//Partie 3
expression: e OU e2 
|  e2
;
e2: e2 ET e3
| e3
;	

%%


//Partie 4
int yyerror(char *s) 
{
  fprintf(stderr, "erreur de syntaxe ligne %d\n", yylineno);
  fprintf(stderr, "%s\n", s);
  fclose(yyin);
  exit(1);
}
