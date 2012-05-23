using namespace std;
#include <cstdlib>
#include <vector>
#include <string>
#include <map>
#include <list>

#include "mytypes.h"
#include "symboltable.h"
#include "errorhandler.h"
#include "lex_yy.hpp"
#include "ytab.hpp"
#include "myScanner.h"


myScanner::myScanner(void) {
	column = 0;
	lineno = 1;
	errors = 0;
	eolComment = 0;
	nullfile = 0;
}


myScanner::~myScanner(void) {

}


void myScanner::PrintToken(UINT32 token) {

string cs;
char tbuf[128];

	sprintf(tbuf,"Line: %d  Token: %s  Lexeme: %s",yylineno,GetTokenString(token).c_str(),yytext);
	cs = tbuf; 
	symTable->pt.push_back(cs);	
	
}



//
// install a lexeme in the symbol table
//
symbl *myScanner::Install(char *plexeme,  UINT32 token) {	


	return symTable->Add(plexeme,token);
}



//
// see if a name is already defined.  If it is, assume it is a type_name
//
UINT32 myScanner::check_type(void) {

symbl *sym = symTable->Find(yytext);

	if (sym) {
		return sym->getToken();;
	}
	return IDENTIFIER;
}



void myScanner::comment(void){
char c;
char prev = 0;
  
	while ((c = input()) != 0) {     /* (EOF maps to 0) */
		fputc(c,yyout);
		if (c == '/' && prev == '*')
			return;
		prev = c;
	}
//	error("unterminated comment");
}



void myScanner::count(void) {

int i;

	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;

//	ECHO;
}



void myScanner::setSymTable (SymbolTable *symT) {
	symTable = symT;
}


void myScanner::setErrorHandler (ErrorHandler *errMgr) {
	errorMgr = errMgr;
}


//
// overide the default yyerror method in yy_scan
//
void myScanner::yyerror (char *fmt, ...) {

char tbuf[128];
string cs;
char *tptr;

	if (nullfile) {
		return;
	}

//	if ( !strcmp(fmt,"Syntax error") ) {
//		return;
//	} else {
		tptr = fmt;
//	}

/*
	printf(" SYNTAX ERROR in line %d:  %s before %s\n",scanner->yylineno, tptr, scanner->yytext);
*/
	sprintf(tbuf," SYNTAX ERROR in line %d: %s before %s\n",yylineno, tptr, yytext);
	cs = tbuf;
    errorMgr->QueMsg(cs);
	return;
}


//
// overide the default yywrap method in yy_scan
//
int myScanner::yywrap(void) {
	return 1;
}




