const IDENTIFIER = 257;
const ATTRIBUTE = 258;
const CONSTANT = 259;
const STRING_LITERAL = 260;
const SIZEOF = 261;
const PTR_OP = 262;
const INC_OP = 263;
const DEC_OP = 264;
const LEFT_OP = 265;
const RIGHT_OP = 266;
const LE_OP = 267;
const GE_OP = 268;
const EQ_OP = 269;
const NE_OP = 270;
const AND_OP = 271;
const OR_OP = 272;
const MUL_ASSIGN = 273;
const DIV_ASSIGN = 274;
const MOD_ASSIGN = 275;
const ADD_ASSIGN = 276;
const SUB_ASSIGN = 277;
const LEFT_ASSIGN = 278;
const RIGHT_ASSIGN = 279;
const AND_ASSIGN = 280;
const XOR_ASSIGN = 281;
const OR_ASSIGN = 282;
const TYPE_NAME = 283;
const TYPEDEF = 284;
const EXTERN = 285;
const STATIC = 286;
const AUTO = 287;
const REGISTER = 288;
const INLINE = 289;
const RESTRICT = 290;
const CHAR = 291;
const SHORT = 292;
const INT = 293;
const LONG = 294;
const SIGNED = 295;
const UNSIGNED = 296;
const FLOAT = 297;
const DOUBLE = 298;
const CONST = 299;
const VOLATILE = 300;
const VOID = 301;
const BOOL = 302;
const COMPLEX = 303;
const IMAGINARY = 304;
const STRUCT = 305;
const UNION = 306;
const ENUM = 307;
const ELLIPSIS = 308;
const CASE = 309;
const DEFAULT = 310;
const IF = 311;
const ELSE = 312;
const SWITCH = 313;
const WHILE = 314;
const DO = 315;
const FOR = 316;
const GOTO = 317;
const CONTINUE = 318;
const BREAK = 319;
const RETURN = 320;
const UNION_STRUCT = 321;
#ifndef YYSTYPE
#define YYSTYPE int
#endif
extern YYSTYPE yylval;

#ifdef YYTRACE
#define YYDEBUG 1
#else
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#endif

// tfl2
#undef YYDEBUG
#define YYDEBUG 1
//

// 
// C++ YACC parser header
// Copyright 1991 by Mortice Kern Systems Inc.  All rights reserved.
//
// yy_parse => class defining a parsing object
//	yy_parse needs a class yy_scan, which defines the scanner.
// %prefix or option -p xx determines name of this class; if not used,
// defaults to 'yy_scan'
//
// constructor fills in the tables for this grammar; give it a size
//    to determine size of state and value stacks. Default is 150 entries.
// destructor discards those state and value stacks
//
// int yy_parse::yyparse(yy_scan *) invokes parse; if this returns,
//	it can be recalled to continue parsing at last point.
// void yy_parse::yyreset() can be called to reset the parse;
//	call yyreset() before yy_parse::yyparse(yy_scan *)
#include <stdio.h>		// uses printf(), et cetera
#include <stdlib.h>		// uses exit()

#if defined(_MSC_VER)
# pragma warning(disable: 4102) // 'yyerrlabel' : unreferenced label
#endif

const YYERRCODE = 256;		// YACC 'error' value

// You can use these macros in your action code
#define YYERROR		goto yyerrlabel
#define YYACCEPT	YYRETURN(0)
#define YYABORT		YYRETURN(1)
#define YYRETURN(val)	return(val)

/*
 * Simulate bitwise negation as if it was done ona two's complement machine.
 * This makes the generated code portable to machines with different 
 * representations of integers (ie. signed magnitude).
 */
#define yyneg(s)	(-((s)+1))

#if YYDEBUG
typedef struct yyNamedType_tag {	/* Tokens */
	char	* name;		/* printable name */
	int		token;		/* token # */
	int		type;		/* token type */
} yyNamedType;
typedef struct yyTypedRules_tag {	/* Typed rule table */
	char	* name;		/* compressed rule string */
	int		type;		/* rule result type */
} yyTypedRules;
#endif

#ifdef YACC_WINDOWS

// include all windows prototypes, macros, constants, etc.

#include <windows.h>

// the following is the handle to the current
// instance of a windows program. The user
// program calling yyparse must supply this!

#ifdef STRICT
extern HINSTANCE hInst;	
#else
extern HANDLE hInst;	
#endif

#endif	/* YACC_WINDOWS */


class yy_parse {
protected:

#ifdef YACC_WINDOWS

	// protected member function for actual scanning 

	int	win_yyparse(yy_scan * ps);	// parse with given scanner

#endif	/* YACC_WINDOWS */

	int	mustfree;	// set if tables should be deleted
	int	size;		// size of state and value stacks
	int	reset;		// if set, reset state
	int		yyi;		// table index
	int		yystate;	// current state

	int		* stateStack;	// states stack
	YYSTYPE	* valueStack;	// values stack
	int		* yyps;		// top of state stack
	YYSTYPE * yypv;		// top of value stack

	YYSTYPE yylval;		// saved yylval
	YYSTYPE	yyval;		// $
	YYSTYPE * yypvt;	// $n
	int	yychar;		// current token
	int	yyerrflag;	// error flag
	int	yynerrs;	// error count
#if YYDEBUG
	int	done;		// set from trace to stop parse
	int	rule, npop;	// reduction rule # and length
	int		* typeStack;	// type stack to mirror valueStack[]
	int		* yytp;		// top of type stack
	char	* yygetState(int);	// read 'states.out'
#endif
public:
#if YYDEBUG
	// C++ has trouble with initialized arrays inside classes
	static long * States;		// pointer to yyStates[]
	static yyTypedRules * Rules;	// pointer to yyRules[]
	static yyNamedType * TokenTypes; // pointer to yyTokenTypes[]
	static int	yyntoken;	// number of tokens
	static int	yynvar;		// number of variables (nonterminals)
	static int	yynstate;	// number of YACC-generated states
	static int	yynrule;	// number of rules in grammar

	char*	yyptok(int);		// printable token string
	int	yyExpandName(int, int, char *, int);
						// expand encoded string
	virtual int	yyGetType(int);		// return type of token
	virtual void	yyShowRead();		// see newly read token
	virtual void	yyShowState();		// see state, value stacks
	virtual void	yyShowReduce();		// see reduction
	virtual void	yyShowGoto();		// see goto
	virtual void	yyShowShift();		// see shift
	virtual void	yyShowErrRecovery();	// see error recovery
	virtual void	yyShowErrDiscard();	// see token discard in error
#endif
	yy_scan* scan;			// pointer to scanner
	int	yydebug;	// if set, tracing if compiled with YYDEBUG=1

	yy_parse(int = 150);	// constructor for this grammar
	yy_parse(int, int *, YYSTYPE *);	// another constructor

	~yy_parse();		// destructor

	int	yyparse(yy_scan * ps);	// parse with given scanner

	void	yyreset() { reset = 1; } // restore state for next yyparse()

	void	setdebug(int y) { yydebug = y; }

// The following are useful in user actions:

	void	yyerrok() { yyerrflag = 0; }	// clear error
	void	yyclearin() { yychar = -1; }	// clear input
	int	YYRECOVERING() { return yyerrflag != 0; }
};
// end of .hpp header
