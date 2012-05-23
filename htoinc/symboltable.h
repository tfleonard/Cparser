//
//	File:		symboltable.h
//
//	Purpose:	This file defines the symbol table classes.  
//
//

#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

#define SYMFULL	0xffffffff		// indicates the symbol table is full


//
// This is the definition of a symbol table record
//


class	symbl {

private:
	string	lexeme;
	UINT32	token;
//	bool	typeName;

public:
	symbl(string &plex, UINT32 tok);
	~symbl();
	string symbolToString(void);
	string getLexeme(void);
	UINT32 getToken(void);
	void	setTypeName(void);
	bool	isTypeName(void);
};

static int newScope = 0;

string GetTokenString(UINT32 token);		// return the string equivalent to a token//


// wrapper functions 
//
// These functions are those defined in the project 1 specification.
//  They serve as wrapper functions for the CPP classes that implement
//  the symbol table and error handler functions.
//

//YYSTYPE Install(char *plexeme,  UINT32 token);
//void strip(char *s);
//void PrintToken(UINT32 token);

char *FormatString(char *buf, char *st, int len);

typedef struct _TokenToString {

    UINT32 token;
    string sptr;

} TokenToString;




//
// The Symbol Table class
//
// This class defines and implements the symbol table
//

class SymbolTable {

private:
	SymbolTable	*parent;				// parent symbol table
	list<SymbolTable *>children;		// child symbol tables
	map<string,symbl *> stab;			// the symbol table
	int scope;

public:
	SymbolTable(SymbolTable *parent);
	~SymbolTable();

	symbl *Add(char *plememe, UINT32 token);	// add a new symbol
	void	PrintTable(FILE *fp);				// dump the symbol table to a file
	void	SetScope(UINT32 scope);			// set the current scope
	UINT32	GetScope(void);						// get the current scope 
	void	PrintProductions(FILE *fp);
	symbl*	Find(char *pLexeme);
	vector<string> pt;
	symbl*	Find(UINT32 tok);
};



#endif // SYMBOLTABLE_H