//
//
// Copyright 2012 tfleonard  dsp_ee@hotmail.com  all rights reserved.
//
// htoinc.cpp : Defines the entry point for the console application.
//

#include "stdio.h"

using namespace std;
#include <cstdlib>
#include <string>
#include <iostream>
#include <vector>
#include <map>
#include <list>

#include "mytypes.h"

#include "symboltable.h"
#include "errorhandler.h"

#include "lex_yy.cpp"
#include "ytab.cpp"



myScanner *scanner;
myParser *parser;

YYSTYPE yylval;
FILE* ifp;
FILE* ofp;

SymbolTable *symTab;
ErrorHandler *errorMgr;

	
int main(int argc, char **argv){

	if (argc <3) {
		cout << "Usage: htoinc Infile Outfile\n";
		exit(1);
	} 

	ifp = fopen(argv[1],"r");
	if (!ifp) {
		cout << "Unable to open input file " << argv[1] << endl;
		exit(1);
	}

	ofp = fopen(argv[2],"w");
	if (!ofp) {
		cout << "Unable to open output file " << argv[2] << endl;
		fclose(ifp);
		exit(1);
	}

	symTab = new SymbolTable(0);
	errorMgr = new ErrorHandler;

	scanner = new myScanner();
	scanner->yyin = ifp;
	scanner->yyout = ofp;
	scanner->setSymTable(symTab);
	scanner->setErrorHandler(errorMgr);

	parser = new myParser();
	parser->setSymTable(symTab);
	parser->setErrorHandler(errorMgr);

	int result = parser->yyparse(scanner);
	
	if (result) {
		fprintf(ofp,"\n***************** Errors *******************************\n");
		errorMgr->PrintMsgs(ofp, scanner->yylineno);
	} else {
		fprintf(ofp,"\n No Errors found\n");
		printf("No errors found\n");
	} 


//	parser->DumpProd(stdout);
	fprintf(ofp,"\n***************** Productions *************************\n");
	symTab->PrintProductions(ofp);
	fprintf(ofp,"\n***************** Symbol Table ***********************\n");
	symTab->PrintTable(ofp);

	fclose(ofp);
	fclose(ifp);

	return 0;
}

