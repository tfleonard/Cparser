%{
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include "lex_yy.hpp"
#include "ytab.hpp"

#include "myScanner.h"

extern myScanner *scanner;

extern  YYSTYPE  yylval;

using namespace std;

/* wrapper functions for myScanner methods */
void count(void);
void comment(void);
UINT32 check_type(void);
void PrintToken(UINT32 token);
/*
symbl *Install(char *plexeme,  UINT32 token);
*/
YYSTYPE Install(char *plexeme,  UINT32 token);


%}

D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			([Ee][+-]?{D}+)
P           ([Pp][+-]?{D}+)
FS			(f|F|l|L)
IS                      ((u|U)|(u|U)?(l|L|ll|LL)|(l|L|ll|LL)(u|U))

%%


"/*"			{ 
		fputs(yytext,yyout);
		comment(); 
	}

"//"[^\n]*              { /* consume //-comment */ 
		fputs(yytext,yyout);
	}

"#"[^\n]*              { /* consume //-comment */ 
		fputs(yytext,yyout);
	}


"auto"			{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,AUTO);
		PrintToken(AUTO);
		return(AUTO); 
	}
"_Bool"			{ 		
		fputs(yytext,yyout);
		yylval = Install(yytext,BOOL);
		PrintToken(BOOL);
		return(BOOL); 
	}
"break"			{
 		fputs(yytext,yyout);
		yylval = Install(yytext,BREAK);
		PrintToken(BREAK);
		return(BREAK); 
	}
"case"			{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,CASE);
		PrintToken(CASE);
		return(CASE); 
	}
"char"			{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,CHAR);
		PrintToken(CHAR);
		return(CHAR); 
	}
"_Complex"		{
 		fputs(yytext,yyout);
		yylval = Install(yytext,COMPLEX);
		PrintToken(COMPLEX);
		return(COMPLEX); 
	}
"const"			{  
		fputs(yytext,yyout);
		yylval = Install(yytext,CONST);
		PrintToken(CONST);
		return(CONST); 
	}
"continue"		{  	
		fputs(yytext,yyout);
		yylval = Install(yytext,CONTINUE);
		PrintToken(CONTINUE);
		return(CONTINUE); 
	}
"default"		{  
		fputs(yytext,yyout);
		yylval = Install(yytext,DEFAULT);
		PrintToken(DEFAULT);
		return(DEFAULT); 
	}
"do"			{  
		fputs(yytext,yyout);
		yylval = Install(yytext,DO);
		PrintToken(DO);
		return(DO); 
	}
"double"		{  
		fputs(yytext,yyout);
		yylval = Install(yytext,DOUBLE);
		PrintToken(DOUBLE);
		return(DOUBLE); 
	}
"else"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,ELSE);
		PrintToken(ELSE);
		return(ELSE); 
	}
"enum"			{  
		fputs(yytext,yyout);
		yylval = Install(yytext,ENUM);
		PrintToken(ENUM);
		return(ENUM); 
	}
"extern"		{  
		fputs(yytext,yyout);
		yylval = Install(yytext,EXTERN);
		PrintToken(EXTERN);
		return(EXTERN); 
	}
"float"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,FLOAT);
		PrintToken(FLOAT);
		return(FLOAT); 
	}
"for"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,FOR);
		PrintToken(FOR);
		return(FOR); 
	}
"goto"			{  
		fputs(yytext,yyout);
		yylval = Install(yytext,GOTO);
		PrintToken(GOTO);
		return(GOTO); 
	}
"if"			{  
		fputs(yytext,yyout);
		yylval = Install(yytext,IF);
		PrintToken(IF);
		return(IF); 
	}
"_Imaginary"	{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,IMAGINARY);
		PrintToken(IMAGINARY);
		return(IMAGINARY); 
	}
"inline"		{  
		fputs(yytext,yyout);
		yylval = Install(yytext,INLINE);
		PrintToken(INLINE);
		return(INLINE); 
	}
"int"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,INT);
		PrintToken(INT);
		return(INT); 
	}
"long"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,LONG);
		PrintToken(LONG);
		return(LONG); 
	}
"register"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,REGISTER);
		PrintToken(REGISTER);
		return(REGISTER); 
	}
"restrict"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,RESTRICT);
		PrintToken(RESTRICT);
		return(RESTRICT); 
	}
"return"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,RETURN);
		PrintToken(RETURN);
		return(RETURN); 
	}
"short"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,SHORT);
		PrintToken(SHORT);
		return(SHORT); }
"signed"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,SIGNED);
		PrintToken(SIGNED);
		return(SIGNED); 
	}
"sizeof"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,SIZEOF);
		PrintToken(SIZEOF);
		return(SIZEOF); 
	}
"static"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,STATIC);
		PrintToken(STATIC);
		return(STATIC); 
	}
"struct"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,STRUCT);
		PrintToken(STRUCT);
		return(STRUCT); 
	}
"switch"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,SWITCH);
		PrintToken(SWITCH);
		return(SWITCH); 
	}
"typedef"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,TYPEDEF);
		PrintToken(TYPEDEF);
		return(TYPEDEF); 
	}
"union"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,UNION);
		PrintToken(UNION);
		return(UNION); 
	}
"unsigned"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,UNSIGNED);
		PrintToken(UNSIGNED);
		return(UNSIGNED); 
	}
"void"			{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,VOID);
		PrintToken(VOID);
		return(VOID); 
	}
"volatile"		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,VOLATILE);
		PrintToken(VOLATILE);
		return(VOLATILE); 
	}
"while"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,WHILE);
		PrintToken(WHILE);
		return(WHILE); 
	}

"__attribute__"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,WHILE);
		PrintToken(ATTRIBUTE);
		return(ATTRIBUTE); 
	}

{L}({L}|{D})*	{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,IDENTIFIER);
		PrintToken(IDENTIFIER);
		return(check_type());  
		/* return(IDENTIFIER); */ 
	}

0[xX]{H}+{IS}?	{
  		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
0[0-7]*{IS}?	{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
[1-9]{D}*{IS}?	{
  		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
L?'(\\.|[^\\'\n])+'	{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}

{D}+{E}{FS}?	{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
{D}*"."{D}+{E}?{FS}?	{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
{D}+"."{D}*{E}?{FS}?	{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
0[xX]{H}+{P}{FS}?	{  
		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
0[xX]{H}*"."{H}+{P}?{FS}?     {
  		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}
0[xX]{H}+"."{H}*{P}?{FS}?     { 
 		fputs(yytext,yyout);
		yylval = Install(yytext,CONSTANT);
		PrintToken(CONSTANT);
		return(CONSTANT); 
	}


L?\"(\\.|[^\\"\n])*\"	{  
		fputs(yytext,yyout);
		yylval = Install(yytext,STRING_LITERAL);
		PrintToken(STRING_LITERAL);
		return(STRING_LITERAL); 
	}

"..."		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,ELLIPSIS);
		PrintToken(ELLIPSIS);
		return(ELLIPSIS); 
	}
">>="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,RIGHT_ASSIGN);
		PrintToken(RIGHT_ASSIGN);
		return(RIGHT_ASSIGN); 
	}
"<<="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,LEFT_ASSIGN);
		PrintToken(LEFT_ASSIGN);
		return(LEFT_ASSIGN); 
	}
"+="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,ADD_ASSIGN);
		PrintToken(ADD_ASSIGN);
		return(ADD_ASSIGN); 
	}
"-="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,SUB_ASSIGN);
		PrintToken(SUB_ASSIGN);
		return(SUB_ASSIGN); 
	}
"*="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,MUL_ASSIGN);
		PrintToken(MUL_ASSIGN);
		return(MUL_ASSIGN); 
	}
"/="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,DIV_ASSIGN);
		PrintToken(DIV_ASSIGN);
		return(DIV_ASSIGN); 
	}
"%="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,MOD_ASSIGN);
		PrintToken(MOD_ASSIGN);
		return(MOD_ASSIGN); 
	}
"&="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,AND_ASSIGN);
		PrintToken(AND_ASSIGN);
		return(AND_ASSIGN); 
	}
"^="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,XOR_ASSIGN);
		PrintToken(XOR_ASSIGN);
		return(XOR_ASSIGN); 
	}
"|="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,OR_ASSIGN);
		PrintToken(OR_ASSIGN);
		return(OR_ASSIGN); 
	}
">>"		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,RIGHT_OP);
		PrintToken(RIGHT_OP);
		return(RIGHT_OP); 
	}
"<<"		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,LEFT_OP);
		PrintToken(LEFT_OP);
		return(LEFT_OP); }
"++"		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,INC_OP);
		PrintToken(INC_OP);
		return(INC_OP); 
	}
"--"		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,DEC_OP);
		PrintToken(DEC_OP);
		return(DEC_OP);
	}
"->"		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,PTR_OP);
		PrintToken(PTR_OP);
		return(PTR_OP); 
	}
"&&"		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,AND_OP);
		PrintToken(AND_OP);
		return(AND_OP); 
	}
"||"		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,OR_OP);
		PrintToken(OR_OP);
		return(OR_OP); 
	}
"<="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,LE_OP);
		PrintToken(LE_OP);
		return(LE_OP); 
	}
">="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,GE_OP);
		PrintToken(GE_OP);
		return(GE_OP); 
	}
"=="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,EQ_OP);
		PrintToken(EQ_OP);
		return(EQ_OP); 
	}
"!="		{
  		fputs(yytext,yyout);
		yylval = Install(yytext,NE_OP);
		PrintToken(NE_OP);
		return(NE_OP); 
	}
";"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,';');
		PrintToken(';');
		return(';'); 
	}
("{"|"<%")	{
  		fputs(yytext,yyout);
		yylval = Install(yytext,'{');
		PrintToken('{');
		return('{'); 
	}
("}"|"%>")		{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'}');
		PrintToken('}');
		return('}'); 
	}
","			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,',');
		PrintToken(',');
		return(','); 
	}
":"			{
  		fputs(yytext,yyout);
		yylval = Install(yytext,':');
		PrintToken(':');
		return(':'); 
	}
"="			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'=');
		PrintToken('=');
		return('='); 
	}
"("			{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,'(');
		PrintToken('(');
		return('('); 
	}
")"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,COMPLEX);
		PrintToken(COMPLEX);
		return(')'); 
	}
("["|"<:")	{
  		fputs(yytext,yyout);
		yylval = Install(yytext,'[');
		PrintToken('[');
		return('['); 
	}
("]"|":>")	{
  		fputs(yytext,yyout);
		yylval = Install(yytext,']');
		PrintToken(']');
		return(']'); 
	}
"."			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'.');
		PrintToken('.');
		return('.'); 
	}
"&"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'&');
		PrintToken('&');
		return('&'); 
	}
"!"			{
 		fputs(yytext,yyout);
		yylval = Install(yytext,'!');
		PrintToken('!');
		return('!'); 
	}
"~"			{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,'~');
		PrintToken('~');
		return('~'); 
	}
"-"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'-');
		PrintToken('-');
		return('-'); 
	}
"+"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'+');
		PrintToken('+');
		return('+'); 
	}
"*"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'*');
		PrintToken('*');
		return('*'); 
	}
"/"			{
  		fputs(yytext,yyout);
		yylval = Install(yytext,'/');
		PrintToken('/');
		return('/'); 
	}
"%"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'%');
		PrintToken('%');
		return('%'); 
	}
"<"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'<');
		PrintToken('<');
		return('<'); 
	}
">"			{
  		fputs(yytext,yyout);
		yylval = Install(yytext,'>');
		PrintToken('>');
		return('>'); 
	}
"^"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'^');
		PrintToken('^');
		return('^'); 
	}
"|"			{ 
		fputs(yytext,yyout);
		yylval = Install(yytext,'|');
		PrintToken('|');
		return('|'); 
	}
"?"			{ 
 		fputs(yytext,yyout);
		yylval = Install(yytext,'?');
		PrintToken('?');
		return('?'); 
	}

[ \t\v\n\f]	{
  		fputs(yytext,yyout);
//		yylval = Install(yytext,COMPLEX);
//		PrintToken(COMPLEX);
	}
.			{ /* Add code to complain about unmatched characters */ }

%%


void comment(void) {

	scanner->comment();
}


void count(void) {

	scanner->count();
}


UINT32 check_type(void) {

	return scanner->check_type();
}



//
// install a lexeme in the symbol table
//
/*
symbl *Install(char *plexeme,  UINT32 token) {	

if (token == TYPEDEF) {
	symbl *sym = scanner->Install(plexeme,token);
	return sym;
}

	return scanner->Install(plexeme,token);
}
*/
YYSTYPE Install(char *plexeme,  UINT32 token) {	

if (token == TYPEDEF) {
	symbl *sym = scanner->Install(plexeme,token);
	return (YYSTYPE)sym;
}

	return (YYSTYPE)scanner->Install(plexeme,token);
}


void PrintToken(UINT32 token) {

	scanner->PrintToken(token);
}






