//#pragma once
//#include "lex_yy.hpp"


class myScanner : public yy_scan {

	SymbolTable		*symTable;
	ErrorHandler	*errorMgr;

	int column;
	int	lineno;
	UINT32	errors;
	int	eolComment;
	int	nullfile;

public:
	myScanner(void);
	~myScanner(void);
	void PrintToken(UINT32 token);
	void setSymTable (SymbolTable *symT);
	void setErrorHandler(ErrorHandler *errMgr);
	symbl *Install(char *plexeme, UINT32 token);
	UINT32 check_type(void);
	void comment(void);
	void count(void);
	//
	// override default virtual functions
	//
	void yyerror (char *fmt, ...); 
	int yywrap(void);
};



