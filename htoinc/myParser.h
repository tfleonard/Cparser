#ifndef MYPARSER_H

#define MYPARSER_H


class myParser : public yy_parse {

private:

	SymbolTable		*symTable;
	ErrorHandler	*errorMgr;
	myScanner		*scanner;
	vector<string>	productions;
	vector<symbl *>	idList;

public:

	myParser(void);
	~myParser(void);
	void DisplayProd(string cs);
	void setSymTable (SymbolTable *symT);
	void setErrorHandler(ErrorHandler *errMgr);
	void DumpProd(FILE *fp);
	void setTypeName(symbl *);
	void AddIdToList(symbl *);
	void ClrIdList(void);
	void UpdateTypeNames(void);
	symbl *getSymbol(UINT32 tok);
	void DisplaySymbol(symbl *sym);

};




#endif
