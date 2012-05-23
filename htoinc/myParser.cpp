
using namespace std;
#include <cstdlib>
#include <vector>
#include <string>
#include <iostream>
#include <map>
#include <list>

#include "mytypes.h"
#include "symboltable.h"
#include "errorhandler.h"
#include "lex_yy.hpp"
#include "ytab.hpp"
#include "myScanner.h"
#include "myParser.h"



myParser::myParser(void) {


}


myParser::~myParser(void) {


}


void myParser::DisplayProd(string cs) {

	productions.push_back(cs);
	symTable->pt.push_back(cs);
}



void myParser::setSymTable (SymbolTable *symT) {

	symTable = symT;

}



void myParser::setErrorHandler(ErrorHandler *errMgr) {

	errorMgr = errMgr;
}


void myParser::DumpProd(FILE *fp) {

	fprintf(fp," Productions recorded by parser:\n");
	for (int i=0; i < (int)productions.size(); i++) {
		fprintf(fp, "%s\n", productions[i].c_str());
	}
}


void myParser::setTypeName(symbl *pSym) {

string cs;
char tbuf[512];

	if (pSym) {
		sprintf(tbuf,"setTypeName: %s updated",pSym->getLexeme().c_str());
		cs = tbuf;
		symTable->pt.push_back(cs);
		pSym->setTypeName();
	} else {
		cs = "setTypeName: Null symbol detected, no symbol added to idList";
		symTable->pt.push_back(cs);
	}
}

void myParser::AddIdToList(symbl *pSym) {
string cs;
char tbuf[512];

	sprintf(tbuf,"AddIdToList: %s added to idList",pSym->getLexeme().c_str());
	cs = tbuf;
	symTable->pt.push_back(cs);

	idList.push_back(pSym);
}

void myParser::ClrIdList(void) {
string cs = "ClrIdList: idList cleared";

	symTable->pt.push_back(cs);
	idList.clear();

}
	
void myParser::UpdateTypeNames(void) {
string cs;
char tbuf[512];


	for (UINT32 i=0; i< idList.size(); i++) {

		sprintf(tbuf,"UpdateTypeNames: %s updated",idList[i]->getLexeme().c_str());
		cs = tbuf; 
		symTable->pt.push_back(cs);
	 
		setTypeName(idList[i]);
	}
}


symbl* myParser::getSymbol(UINT32 tok) {

symbl *sym = symTable->Find(tok);
	return sym;

}


void myParser::DisplaySymbol(symbl *sym) {

string cs;
string ts;

char tbuf[512];
	ts = GetTokenString(sym->getToken());
	cs = sym->getLexeme();
	sprintf(tbuf,"Parser: Token: %s  Lexeme %s",ts.c_str(),cs.c_str());
	cs = tbuf;
	symTable->pt.push_back(cs);

}