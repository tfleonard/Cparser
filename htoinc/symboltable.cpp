
//
// File:	Symboltable.cpp
//
//	Purpose:	This file implements the member functions for the
//				SymbolTable class
//
//	Copyright 2003 by Tim Leonard, all rights reserved
//	


#include <stdio.h>



using namespace std;
#include <cstdlib>
#include <vector>
#include <string>
#include <map>
#include <list>

#include "mytypes.h"

class symbl;


//#include "errorhandler.h"
#include "lex_yy.hpp"
#include "ytab.hpp"

#include "symboltable.h"




symbl::symbl(string &plex, UINT32 tok) {

	lexeme = plex; 	
	token = tok;
}

symbl::~symbl(void) {

}


string symbl::getLexeme(void) {
	return lexeme;
}


void	symbl::setTypeName(void) {
	token = TYPE_NAME;
//	typeName = true;
}


//bool	symbl::isTypeName(void) {
//	return typeName;
//}


UINT32 symbl::getToken() {
	return token;
}



//
//	Method:		SymbolTable class constructor
//
//	Purpose:	Initialize the symbol table index, next to 0.
//				This indicates an empty table,  
//
//	Input:		nothing
//
//	Output:		nothing
//
//	Side Effects:
//
//
SymbolTable::SymbolTable (SymbolTable *parent) {

	scope = newScope++;
	this->parent = parent; 
	children.clear();
	stab.clear();
}


//
//	Method:		SymbolTable class destructor
//
//	Purpose:	Clean out all of the symbol table entries.
//				Lexemes stored in the table are strings created
//				in dynamic memory, so they must be deleted.  
//
//	Input:		nothing
//
//	Output:		nothing
//
//	Side Effects:
//				Frees dynamic memory pointed to by pLexeme
//

SymbolTable::~SymbolTable(void) {

symbl *sym;

	for each ( pair<string,symbl *> p in stab ) {
		sym = p.second;
		delete sym;
	}		
}


//
//	Method:		Add
//
//	Purpose:	Add a symbol to the table.
//				The lexeme for the symbol is copied,  
//
//	Input:		lexeme and token
//
//	Output:		returns non-zero if an error occurs.
//
//	Side Effects:
//				Allocates dynamic memory for the lexeme.
//
//	Note:	
//			Strings are stored with the leading and trailing double quotes.
//
//			Character literals are stored with the leading and trailing
//			single quotes.
//
//			Integer literals are stored as a string of digit characters.
//
//			This means the consumer of the lexems will have to convert
//			them to a suitable format.
//

symbl *SymbolTable::Add(char *plexeme, UINT32 token) {

string lex = plexeme;

//
// check for duplicate symbols with the same type
//
	if (stab.find(lex) != stab.end()) {
		return (symbl *)stab[lex];
	}

	symbl *newSymbol = new symbl(lex,token);
	stab[lex] = newSymbol;
	return newSymbol;	
}


//
//	Method:		PrintTable
//
//	Purpose:	Overloaded version of PrintTable that writes the
//				contents of the symbol table to a file.
//
//	Input:		file pointer
//
//	Output:		nothing.
//
//	Side Effects:
//				Writes to the file
//

void SymbolTable::PrintTable(FILE *fp) {

string	line;

	if (stab.empty()) {
		fprintf(fp," *** Symbol Table is empty ***\n");
		return;
	}

	fprintf(fp,"\n\n Symbol Table:  \n\n");
	fprintf(fp,"Token     Lexeme                            Scope\n");

	for each (pair<string,symbl *> p in stab) {	

		if (p.first != "") {
			line = (p.second)->symbolToString();
			fprintf(fp,"%s %s\n", line.c_str(),(p.second)->getLexeme().c_str());
		}
    }
}


void	SymbolTable::PrintProductions(FILE *fp) {

	fprintf(fp," Productions recorded by SymbolTable class:\n");
	for (int i=0; i < (int)pt.size(); i++) {
		fprintf(fp, "%s\n", pt[i].c_str());
	}
}



//
// get a string representing the next symbol table entry
//
// returns 0 if end of table
//

string symbl::symbolToString(void) {

	return GetTokenString(token);
}





//
// set the Current scope for the Symbol Table entry
//
void SymbolTable::SetScope(UINT32 scope) {
	
	this->scope = scope;
}


//
// get the Scope for the symbol table entry
//
UINT32 SymbolTable::GetScope(void) {
	return scope;
}


symbl *SymbolTable::Find(char *pLexeme) {

map<string,symbl *>::iterator it;

string cs = pLexeme;

	it = stab.find(cs);
	if (it == stab.end()) {
		return ((symbl*)0);
	}
	return stab[cs];
}


symbl *SymbolTable::Find(UINT32 tok) {

	for each (pair<string,symbl *> p in stab) {	

		if (p.second->getToken() == tok) {
			return p.second;		
		}
	}
	string cs = "Unknown";
	symbl *sym = new symbl(cs,tok);
	return sym;
}



//
// this table maps a token to its corresponding string
//

TokenToString	TokenMap[] = {
{IDENTIFIER      , "IDENTIFIER      "},
{TYPE_NAME       , "TYPE_NAME       "},
{ATTRIBUTE       , "ATTRIBUTE       "},
{CONSTANT        , "CONSTANT        "},
{STRING_LITERAL  , "STRING_LITERAL  "},
{SIZEOF          , "SIZEOF          "},
{PTR_OP          , "PTR_OP          "},
{INC_OP          , "INC_OP          "},
{DEC_OP          , "DEC_OP          "},
{LEFT_OP         , "LEFT_OP         "},
{RIGHT_OP        , "RIGHT_OP        "},
{LE_OP           , "LE_OP           "},
{GE_OP           , "GE_OP           "},
{EQ_OP           , "EQ_OP           "},
{NE_OP           , "NE_OP           "},
{AND_OP          , "AND_OP          "},
{OR_OP           , "OR_OP           "}, 
{MUL_ASSIGN      , "MUL_ASSIGN      "},
{DIV_ASSIGN      , "DIV_ASSIGN      "},
{MOD_ASSIGN      , "MOD_ASSIGN      "},
{ADD_ASSIGN      , "ADD_ASSIGN      "},
{SUB_ASSIGN      , "SUB_ASSIGN      "},
{LEFT_ASSIGN     , "LEFT_ASSIGN     "},
{RIGHT_ASSIGN    , "RIGHT_ASSIGN    "},
{AND_ASSIGN      , "AND_ASSIGN      "},
{XOR_ASSIGN      , "XOR_ASSIGN      "},
{XOR_ASSIGN      , "XOR_ASSIGN      "}, 
{TYPE_NAME       , "TYPE_NAME       "}, 
{TYPEDEF         , "TYPEDEF         "}, 
{EXTERN          , "EXTERN          "}, 
{STATIC          ,"STATIC          "}, 
{AUTO            ,"AUTO            "}, 
{REGISTER        ,"REGISTER        "}, 
{INLINE          ,"INLINE          "}, 
{RESTRICT        ,"RESTRICT        "}, 
{CHAR            ,"CHAR            "}, 
{SHORT           ,"SHORT           "}, 
{INT             ,"INT             "}, 
{LONG            ,"LONG            "}, 
{SIGNED          ,"SIGNED          "}, 
{UNSIGNED        ,"UNSIGNED        "}, 
{FLOAT           ,"FLOAT           "}, 
{DOUBLE          ,"DOUBLE          "}, 
{VOLATILE        ,"VOLATILE        "}, 
{VOID            ,"VOID            "}, 
{BOOL            ,"BOOL            "}, 
{COMPLEX         ,"COMPLEX         "}, 
{IMAGINARY       ,"IMAGINARY       "}, 
{STRUCT          ,"STRUCT          "}, 
{UNION           ,"UNION           "}, 
{ENUM            ,"ENUM            "}, 
{ELLIPSIS        ,"ELLIPSIS        "}, 
{CASE            ,"CASE            "}, 
{DEFAULT         ,"DEFAULT         "}, 
{IF              ,"IF              "}, 
{ELSE            ,"ELSE            "}, 
{SWITCH          ,"SWITCH          "}, 
{WHILE           ,"WHILE           "}, 
{DO              ,"DO              "}, 
{FOR             ,"FOR             "}, 
{GOTO            ,"GOTO            "}, 
{CONTINUE        ,"CONTINUE        "}, 
{BREAK           ,"BREAK           "}, 
{RETURN          ,"RETURN          "}
};



//
//	Function:	GetTokenString
//
//	Purpose:	Return a character string for a token.
//
//	Input:		token
//
//	Output:		pointer to a null terminated string
//
//	Side Effects:
//

string GetTokenString(UINT32 token) {

string def = "UNKNOWN   ";
char buf[32];


	if ((token < 256) && isprint(token)) {
		sprintf(buf,"%c",token);
		string s = buf;
		return s;
	}

	for (UINT32 i=0;i< ( sizeof(TokenMap) / sizeof(TokenToString)) ;i++) {
		if (TokenMap[i].token == token) {
			return TokenMap[i].sptr;
		}
	}
	return def;
}







