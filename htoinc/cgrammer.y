%{

#define YYDEBUG	1
#define YYERROR_VERBOSE	1
yydebug = 1;
#define DISPLAY_PROD	1



#include "symboltable.h"
#include "myParser.h"

extern myParser *parser;

void DisplayProd(string cs);
/*
void SetTypeName(symbl *sym);
*/
void SetTypeName(YYSTYPE sym);
void UpdateTypeNames(YYSTYPE tok);
void AddIdToList(YYSTYPE sym);
void ClrIdList(void);
YYSTYPE GetSymbol(YYSTYPE tok);
void DisplayLexeme(YYSTYPE sym);

YYSTYPE	lastSym;

/*
This grammar 
*/


%}


/*
%union {
	int		val;
	symbl	*sym; 
}
*/

/*
%token <sym> IDENTIFIER 
*/

%token IDENTIFIER 
%token ATTRIBUTE
%token CONSTANT STRING_LITERAL SIZEOF
%token PTR_OP INC_OP DEC_OP LEFT_OP RIGHT_OP LE_OP GE_OP EQ_OP NE_OP
%token AND_OP OR_OP MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN
%token SUB_ASSIGN LEFT_ASSIGN RIGHT_ASSIGN AND_ASSIGN
%token XOR_ASSIGN OR_ASSIGN TYPE_NAME

%token TYPEDEF EXTERN STATIC AUTO REGISTER INLINE RESTRICT
%token CHAR SHORT INT LONG SIGNED UNSIGNED FLOAT DOUBLE CONST VOLATILE VOID
%token BOOL COMPLEX IMAGINARY
%token STRUCT UNION ENUM ELLIPSIS

%token CASE DEFAULT IF ELSE SWITCH WHILE DO FOR GOTO CONTINUE BREAK RETURN

/* internal tokens */
%token UNION_STRUCT

%start translation_unit

/*
%type <sym> declarator
%type <sym> direct_declarator
*/




%%

primary_expression
	: IDENTIFIER						{DisplayProd(" primary_expression -> IDENTIFIER"); }
	| CONSTANT							{DisplayProd(" primary_expression -> CONSTANT"); }
	| STRING_LITERAL					{DisplayProd(" primary_expression -> STRING_LITERAL"); }
	| '(' expression ')'				{DisplayProd(" primary_expression -> '(' expression ')'"); }
	;

postfix_expression
	: primary_expression									{DisplayProd(" postfix_expression -> primary_expression"); }
	| postfix_expression '[' expression ']'					{DisplayProd(" postfix_expression -> postfix_expression '[' expression ']'"); }
	| postfix_expression '(' ')'							{DisplayProd(" postfix_expression -> postfix_expression '(' ')'"); }
	| postfix_expression '(' argument_expression_list ')'	{DisplayProd(" postfix_expression -> postfix_expression '(' argument_expression_list ')'"); }
	| postfix_expression '.' IDENTIFIER						{DisplayProd(" postfix_expression -> postfix_expression '.' IDENTIFIER"); }
	| postfix_expression PTR_OP IDENTIFIER					{DisplayProd(" postfix_expression -> postfix_expression PTR_OP IDENTIFIER"); }
	| postfix_expression INC_OP								{DisplayProd(" postfix_expression -> postfix_expression INC_OP"); }
	| postfix_expression DEC_OP								{DisplayProd(" postfix_expression -> postfix_expression DEC_OP"); }
	| '(' type_name ')' '{' initializer_list '}'			{DisplayProd(" postfix_expression -> '(' type_name ')' '{' initializer_list '}'"); }
	| '(' type_name ')' '{' initializer_list ',' '}'		{DisplayProd(" postfix_expression -> '(' type_name ')' '{' initializer_list ',' '}'"); }	
	;

argument_expression_list
	: assignment_expression									{DisplayProd(" argument_expression_list -> assignment_expression"); }
	| argument_expression_list ',' assignment_expression	{DisplayProd(" argument_expression_list -> argument_expression_list ',' assignment_expression"); }
	;

unary_expression
	: postfix_expression				{DisplayProd(" unary_expression -> postfix_expression"); }
	| INC_OP unary_expression			{DisplayProd(" unary_expression -> INC_OP unary_expression"); }
	| DEC_OP unary_expression			{DisplayProd(" unary_expression -> DEC_OP unary_expression"); }
	| unary_operator cast_expression	{DisplayProd(" unary_expression -> unary_operator cast_expression"); }
	| SIZEOF unary_expression			{DisplayProd(" unary_expression -> SIZEOF unary_expression"); }
	| SIZEOF '(' type_name ')'			{DisplayProd(" unary_expression -> SIZEOF '(' type_name ')'"); }
	;

unary_operator
	: '&'			{DisplayProd(" unary_operator -> '&'"); }
	| '*'			{DisplayProd(" unary_operator -> '*'"); }
	| '+'			{DisplayProd(" unary_operator -> '+'"); }
	| '-'			{DisplayProd(" unary_operator -> '-'"); }
	| '~'			{DisplayProd(" unary_operator -> '~'"); }
	| '!'			{DisplayProd(" unary_operator -> '!'"); }
	;

cast_expression
	: unary_expression						{DisplayProd(" cast_expression -> unary_expression"); }
	| '(' type_name ')' cast_expression		{DisplayProd(" cast_expression -> '(' type_name ')' cast_expression"); }
	;

multiplicative_expression
	: cast_expression									{DisplayProd(" multiplicative_expression -> cast_expression"); }
	| multiplicative_expression '*' cast_expression		{DisplayProd(" multiplicative_expression -> multiplicative_expression '*' cast_expression"); }
	| multiplicative_expression '/' cast_expression		{DisplayProd(" multiplicative_expression -> multiplicative_expression '/' cast_expression"); }
	| multiplicative_expression '%' cast_expression		{DisplayProd(" multiplicative_expression -> multiplicative_expression '%' cast_expression"); }
	;

additive_expression
	: multiplicative_expression								{DisplayProd(" additive_expression -> multiplicative_expression"); }
	| additive_expression '+' multiplicative_expression		{DisplayProd(" additive_expression -> additive_expression '+' multiplicative_expression"); }
	| additive_expression '-' multiplicative_expression		{DisplayProd(" additive_expression -> additive_expression '-' multiplicative_expression"); }
	;

shift_expression
	: additive_expression								{DisplayProd(" shift_expression -> additive_expression"); }
	| shift_expression LEFT_OP additive_expression		{DisplayProd(" shift_expression -> shift_expression LEFT_OP additive_expression"); }
	| shift_expression RIGHT_OP additive_expression		{DisplayProd(" shift_expression -> shift_expression RIGHT_OP additive_expression"); }
	;

relational_expression
	: shift_expression									{DisplayProd(" relational_expression -> shift_expression"); }
	| relational_expression '<' shift_expression		{DisplayProd(" relational_expression -> relational_expression '<' shift_expression"); }
	| relational_expression '>' shift_expression		{DisplayProd(" relational_expression -> relational_expression '>' shift_expression"); }
	| relational_expression LE_OP shift_expression		{DisplayProd(" relational_expression -> relational_expression LE_OP shift_expression"); }
	| relational_expression GE_OP shift_expression		{DisplayProd(" relational_expression -> relational_expression GE_OP shift_expression"); }
	;

equality_expression
	: relational_expression								{DisplayProd(" equality_expression -> relational_expression"); }
	| equality_expression EQ_OP relational_expression	{DisplayProd(" equality_expression -> equality_expression EQ_OP relational_expression"); }
	| equality_expression NE_OP relational_expression	{DisplayProd(" equality_expression -> equality_expression NE_OP relational_expression"); }
	;

and_expression
	: equality_expression						{DisplayProd(" and_expression -> equality_expression"); }
	| and_expression '&' equality_expression	{DisplayProd(" and_expression -> and_expression '&' equality_expression"); }
	;

exclusive_or_expression
	: and_expression								{DisplayProd(" exclusive_or_expression -> and_expression"); }
	| exclusive_or_expression '^' and_expression	{DisplayProd(" exclusive_or_expression -> exclusive_or_expression '^' and_expression"); }
	;

inclusive_or_expression
	: exclusive_or_expression								{DisplayProd(" inclusive_or_expression -> exclusive_or_expression"); }
	| inclusive_or_expression '|' exclusive_or_expression	{DisplayProd(" inclusive_or_expression -> inclusive_or_expression '|' exclusive_or_expressionn"); }
	;

logical_and_expression
	: inclusive_or_expression									{DisplayProd(" logical_and_expression -> inclusive_or_expression"); }
	| logical_and_expression AND_OP inclusive_or_expression		{DisplayProd(" logical_and_expression -> logical_and_expression AND_OP inclusive_or_expression"); }
	;

logical_or_expression
	: logical_and_expression									{DisplayProd(" logical_or_expression -> logical_and_expression"); }
	| logical_or_expression OR_OP logical_and_expression		{DisplayProd(" logical_or_expression -> logical_or_expression OR_OP logical_and_expression"); }
	;

conditional_expression
	: logical_or_expression												{DisplayProd(" conditional_expression -> logical_or_expression"); }
	| logical_or_expression '?' expression ':' conditional_expression	{DisplayProd(" conditional_expression -> logical_or_expression '?' expression ':' conditional_expression"); }
	;

assignment_expression
	: conditional_expression										{DisplayProd(" assignment_expression -> conditional_expression"); }
	| unary_expression assignment_operator assignment_expression	{DisplayProd(" assignment_expression -> unary_expression assignment_operator assignment_expression"); }
	;

assignment_operator
	: '='				{DisplayProd(" assignment_operator -> '='"); }
	| MUL_ASSIGN		{DisplayProd(" assignment_operator -> MUL_ASSIGN"); }
	| DIV_ASSIGN		{DisplayProd(" assignment_operator -> DIV_ASSIGN"); }
	| MOD_ASSIGN		{DisplayProd(" assignment_operator -> MOD_ASSIGN"); }
	| ADD_ASSIGN		{DisplayProd(" assignment_operator -> ADD_ASSIGN"); }
	| SUB_ASSIGN		{DisplayProd(" assignment_operator -> SUB_ASSIGN"); }
	| LEFT_ASSIGN		{DisplayProd(" assignment_operator -> LEFT_ASSIGN"); }
	| RIGHT_ASSIGN		{DisplayProd(" assignment_operator -> RIGHT_ASSIGN"); }
	| AND_ASSIGN		{DisplayProd(" assignment_operator -> AND_ASSIGN"); }
	| XOR_ASSIGN		{DisplayProd(" assignment_operator -> XOR_ASSIGN"); }
	| OR_ASSIGN			{DisplayProd(" assignment_operator -> OR_ASSIGN"); }
	;

expression
	: assignment_expression						{DisplayProd(" expression -> assignment_expressio"); }
	| expression ',' assignment_expression		{DisplayProd(" expression -> expression ',' assignment_expression"); }
	;

constant_expression
	: conditional_expression			{DisplayProd(" constant_expression -> conditional_expression"); }
	;

declaration
	: declaration_specifiers ';'											{ ClrIdList(); DisplayProd(" declaration -> declaration_specifiers ';'"); }
	| declaration_specifiers init_declarator_list ';'						{ UpdateTypeNames($1); DisplayProd(" declaration -> declaration_specifiers init_declarator_list ';'"); }
	| declaration_specifiers attribute_specifiers ';'						{ UpdateTypeNames($1); DisplayProd(" declaration -> declaration_specifiers attribute_specifiers ';'"); }
	| declaration_specifiers init_declarator_list attribute_specifiers ';'	{ UpdateTypeNames($1); DisplayProd(" declaration -> declaration_specifiers init_declarator_list attribute_specifiers ';'"); }
	;

declaration_specifiers
	: storage_class_specifier							{ $$ = -1; DisplayProd(" declaration_specifiers -> storage_class_specifier"); }
	| storage_class_specifier declaration_specifiers	{ $$ = $1; DisplayProd(" declaration_specifiers -> storage_class_specifier declaration_specifiers"); }
	| type_specifier									{ $$ = $1; DisplayProd(" declaration_specifiers -> type_specifier"); }
	| type_specifier declaration_specifiers				{ $$ = $2; DisplayProd(" declaration_specifiers -> type_specifier declaration_specifiers"); }
	| type_qualifier									{ $$ = -1; DisplayProd(" declaration_specifiers -> type_qualifier"); }
	| type_qualifier declaration_specifiers				{ $$ = -1; DisplayProd(" declaration_specifiers -> type_qualifier declaration_specifiers	"); }
	| function_specifier								{ $$ = -1; DisplayProd(" declaration_specifiers -> function_specifier"); }
	| function_specifier declaration_specifiers			{ $$ = -1; DisplayProd(" declaration_specifiers -> function_specifier declaration_specifiers"); }
	;

init_declarator_list
	: init_declarator								{ AddIdToList($1); DisplayProd(" init_declarator_list -> init_declarator"); }
	| init_declarator_list ',' init_declarator		{ AddIdToList($3); DisplayProd(" init_declarator_list -> init_declarator_list ',' init_declarator"); }
	;

init_declarator
	: declarator					{$$=$1; DisplayProd(" init_declarator -> declarator"); }
	| declarator '=' initializer	{$$=$1; DisplayProd(" init_declarator -> declarator '=' initializer"); }
	;

storage_class_specifier
	: TYPEDEF				{ DisplayLexeme($1); $$ = $1;  DisplayProd(" storage_class_specifier -> TYPEDEF"); }
	| EXTERN				{$$ = $1; DisplayProd(" storage_class_specifier -> EXTERN"); }
	| STATIC				{$$ = $1; DisplayProd(" storage_class_specifier -> STATIC"); }
	| AUTO					{$$ = $1; DisplayProd(" storage_class_specifier -> AUTO"); }
	| REGISTER				{$$ = $1; DisplayProd(" storage_class_specifier -> REGISTER"); }
	;

type_specifier
	: VOID							{ $$=$1; DisplayProd(" type_specifier -> VOID"); }
	| CHAR							{ $$=$1; DisplayProd(" type_specifier -> CHAR"); }
	| SHORT							{ $$=$1; DisplayProd(" type_specifier -> SHORT"); }
	| INT							{ $$=$1; DisplayProd(" type_specifier -> INT"); }
	| LONG							{ $$=$1; DisplayProd(" type_specifier -> LONG"); }
	| FLOAT							{ $$=$1; DisplayProd(" type_specifier -> FLOAT"); }
	| DOUBLE						{ $$=$1; DisplayProd(" type_specifier -> DOUBLEF"); }
	| SIGNED						{ $$=$1; DisplayProd(" type_specifier -> SIGNED"); }
	| UNSIGNED						{ $$=$1; DisplayProd(" type_specifier -> UNSIGNED"); }
	| BOOL							{ $$=$1; DisplayProd(" type_specifier -> BOOL"); }
	| COMPLEX						{ $$=$1; DisplayProd(" type_specifier -> COMPLEX"); }
	| IMAGINARY						{ $$=$1; DisplayProd(" type_specifier -> IMAGINARY"); }
	| struct_or_union_specifier		{ $$=GetSymbol(UNION_STRUCT); DisplayProd(" type_specifier -> struct_or_union_specifier"); }
	| enum_specifier				{ $$=GetSymbol(ENUM); DisplayProd(" type_specifier -> enum_specifier"); }
	| TYPE_NAME						{ $$=$1; DisplayProd(" type_specifier -> TYPE_NAME"); }
	;


struct_or_union_specifier
	: struct_or_union IDENTIFIER '{' struct_declaration_list '}'	{	
																		DisplayProd(" struct_or_union_specifier -> struct_or_union IDENTIFIER '{' struct_declaration_list '}'"); 
																	}
	| struct_or_union '{' struct_declaration_list '}'				{
																		DisplayProd(" struct_or_union_specifier -> struct_or_union '{' struct_declaration_list '}'"); 
																	}
	| struct_or_union IDENTIFIER									{		
																		DisplayProd(" struct_or_union_specifier -> struct_or_union IDENTIFIER"); 
																	}
	;


attribute_specifiers
	: attribute_specifier '(' primary_expression ')'		{DisplayProd(" attribute_specifier '(' primary_expression ')' "); }
	;


attribute_specifier
	: ATTRIBUTE		{DisplayProd(" attribute_specifier -> ATTRIBUTE"); }
	;

struct_or_union
	: STRUCT		{DisplayProd(" struct_or_union -> STRUCT"); }
	| UNION			{DisplayProd(" struct_or_union -> UNION"); }
	;

struct_declaration_list
	: struct_declaration							{DisplayProd(" struct_declaration_list -> struct_declaration"); }
	| struct_declaration_list struct_declaration	{DisplayProd(" struct_declaration_list -> struct_declaration_list struct_declaration"); }
	| anonymous_union								{DisplayProd(" *** anonymoous_union -> struct_declaration ***"); }
	| struct_declaration_list anonymous_union		{DisplayProd(" *** struct_declaration_list -> struct_declaration_list anonymous_union ***"); }
	;

anonymous_union
	: specifier_qualifier_list ';'					{DisplayProd(" *** tfl -- anonymous unions:  anonymous_union -> specifier_qualifier_list ';' ***"); }
	;

struct_declaration
	: specifier_qualifier_list struct_declarator_list ';'		{DisplayProd(" struct_declaration -> specifier_qualifier_list struct_declarator_list ';'"); }
	;

specifier_qualifier_list
	: type_specifier specifier_qualifier_list			{DisplayProd(" specifier_qualifier_list -> type_specifier specifier_qualifier_list"); }
	| type_specifier									{DisplayProd(" specifier_qualifier_list -> type_specifier"); }
	| type_qualifier specifier_qualifier_list			{DisplayProd(" specifier_qualifier_list -> type_qualifier specifier_qualifier_list"); }
	| type_qualifier									{DisplayProd(" specifier_qualifier_list -> type_qualifier"); }
	;

struct_declarator_list
	: struct_declarator									{DisplayProd(" struct_declarator_list -> struct_declarator"); }
	| struct_declarator_list ',' struct_declarator		{DisplayProd(" struct_declarator_list -> struct_declarator_list ',' struct_declarator"); }
	;

struct_declarator
	: declarator							{DisplayProd(" struct_declarator -> declarator");} 
	| ':' constant_expression				{DisplayProd(" struct_declarator -> ':' constant_expression");}
	| declarator ':' constant_expression	{DisplayProd(" struct_declarator -> declarator ':' constant_expression");}
	;

enum_specifier
	: ENUM '{' enumerator_list '}'					{DisplayProd(" enum_specifier -> ENUM '{' enumerator_list '}'"); }
	| ENUM IDENTIFIER '{' enumerator_list '}'		{ SetTypeName($2); DisplayProd(" enum_specifier -> ENUM IDENTIFIER '{' enumerator_list '}'"); }
	| ENUM '{' enumerator_list ',' '}'				{DisplayProd(" enum_specifier -> ENUM '{' enumerator_list ',' '}'"); }
	| ENUM IDENTIFIER '{' enumerator_list ',' '}'	{ SetTypeName($2); DisplayProd(" enum_specifier -> ENUM IDENTIFIER '{' enumerator_list ',' '}"); }
	| ENUM IDENTIFIER								{ SetTypeName($2); DisplayProd(" enum_specifier -> ENUM IDENTIFIER"); }
	;

enumerator_list
	: enumerator									{DisplayProd(" enumerator_list -> enumerator"); }
	| enumerator_list ',' enumerator				{DisplayProd(" enumerator_list -> enumerator_list ',' enumerator"); }
	;

enumerator
	: IDENTIFIER								{DisplayProd(" enumerator -> IDENTIFIER"); }
	| IDENTIFIER '=' constant_expression		{DisplayProd(" enumerator -> IDENTIFIER '=' constant_expression"); }
	;

type_qualifier
	: CONST				{DisplayProd(" type_qualifier -> CONST"); }
	| RESTRICT			{DisplayProd(" type_qualifier -> RESTRICT"); }
	| VOLATILE			{DisplayProd(" type_qualifier -> VOLATILE"); }
	;

function_specifier
	: INLINE			{DisplayProd(" function_specifier -> INLINE"); }
	;

declarator
	: pointer direct_declarator		{$$ = $2; DisplayProd(" declarator -> pointer direct_declarator"); }
	| direct_declarator				{$$ = $1; DisplayProd(" declarator -> direct_declarator"); }
	;


direct_declarator
	: IDENTIFIER																	{$$=$1; DisplayProd(" direct_declarator -> IDENTIFIER"); lastSym = $1;}
	| '(' declarator ')'															{$$=$2; DisplayProd(" direct_declarator -> '(' declarator ')'"); }
	| direct_declarator '[' type_qualifier_list assignment_expression ']'			{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' type_qualifier_list assignment_expression ']'"); }
	| direct_declarator '[' type_qualifier_list ']'									{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' type_qualifier_list ']'"); }
	| direct_declarator '[' assignment_expression ']'								{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' assignment_expression ']'"); }
	| direct_declarator '[' STATIC type_qualifier_list assignment_expression ']'	{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' STATIC type_qualifier_list assignment_expression ']'"); }
	| direct_declarator '[' type_qualifier_list STATIC assignment_expression ']'	{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' type_qualifier_list STATIC assignment_expression ']'"); }
	| direct_declarator '[' type_qualifier_list '*' ']'								{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' type_qualifier_list '*' ']'"); }
	| direct_declarator '[' '*' ']'													{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' '*' ']'"); }
	| direct_declarator '[' ']'														{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '[' ']'"); }
	| direct_declarator '(' parameter_type_list ')'									{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '(' parameter_type_list ')'"); }
	| direct_declarator '(' identifier_list ')'										{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '(' identifier_list ')'"); }
	| direct_declarator '(' ')'														{$$=$1; DisplayProd(" direct_declarator -> direct_declarator '(' ')'"); }
	;

pointer
	: '*'									{DisplayProd(" pointer -> '*'"); }
	| '*' type_qualifier_list				{DisplayProd(" pointer -> '*' type_qualifier_list"); }
	| '*' pointer							{DisplayProd(" pointer -> '*' pointer"); }
	| '*' type_qualifier_list pointer		{DisplayProd(" pointer -> '*' type_qualifier_list pointer"); }
	;

type_qualifier_list
	: type_qualifier						{DisplayProd(" type_qualifier_list -> type_qualifier"); }
	| type_qualifier_list type_qualifier	{DisplayProd(" type_qualifier_list -> type_qualifier_list type_qualifier"); }
	;


parameter_type_list
	: parameter_list					{DisplayProd(" parameter_type_list -> parameter_list"); }
	| parameter_list ',' ELLIPSIS		{DisplayProd(" parameter_type_list -> parameter_list ',' ELLIPSIS"); }
	;

parameter_list
	: parameter_declaration							{DisplayProd(" parameter_list -> parameter_declaration"); }
	| parameter_list ',' parameter_declaration		{DisplayProd(" parameter_list -> parameter_list ',' parameter_declaration"); }
	;

parameter_declaration
	: declaration_specifiers declarator				{DisplayProd(" parameter_declaration -> declaration_specifiers declarator"); }
	| declaration_specifiers abstract_declarator	{DisplayProd(" parameter_declaration -> declaration_specifiers abstract_declarato"); }
	| declaration_specifiers						{DisplayProd(" parameter_declaration -> declaration_specifiers"); }
	;

identifier_list
	: IDENTIFIER						{DisplayProd(" identifier_list -> IDENTIFIER"); }
	| identifier_list ',' IDENTIFIER	{DisplayProd(" identifier_list -> identifier_list ',' IDENTIFIER"); }
	;

type_name
	: specifier_qualifier_list							{DisplayProd(" type_name -> specifier_qualifier_list"); }
	| specifier_qualifier_list abstract_declarator		{DisplayProd(" type_name -> specifier_qualifier_list abstract_declarator"); }
	;

abstract_declarator
	: pointer								{DisplayProd(" abstract_declarator -> pointer"); }
	| direct_abstract_declarator			{DisplayProd(" abstract_declarator -> direct_abstract_declarator"); }
	| pointer direct_abstract_declarator	{DisplayProd(" abstract_declarator -> pointer direct_abstract_declarator"); }
	;

direct_abstract_declarator
	: '(' abstract_declarator ')'									{DisplayProd(" direct_abstract_declarator -> '(' abstract_declarator ')'"); }
	| '[' ']'														{DisplayProd(" direct_abstract_declarator -> '[' ']'"); }
	| '[' assignment_expression ']'									{DisplayProd(" direct_abstract_declarator -> '[' assignment_expression ']'"); }
	| direct_abstract_declarator '[' ']'							{DisplayProd(" direct_abstract_declarator -> direct_abstract_declarator '[' ']'"); }
	| direct_abstract_declarator '[' assignment_expression ']'		{DisplayProd(" direct_abstract_declarator -> direct_abstract_declarator '[' assignment_expression ']'"); }
	| '[' '*' ']'													{DisplayProd(" direct_abstract_declarator -> '[' '*' ']'"); }
	| direct_abstract_declarator '[' '*' ']'						{DisplayProd(" direct_abstract_declarator -> direct_abstract_declarator '[' '*' ']'"); }
	| '(' ')'														{DisplayProd(" direct_abstract_declarator -> '(' ')'"); }
	| '(' parameter_type_list ')'									{DisplayProd(" direct_abstract_declarator -> '(' parameter_type_list ')'"); }
	| direct_abstract_declarator '(' ')'							{DisplayProd(" direct_abstract_declarator -> direct_abstract_declarator '(' ')'"); }
	| direct_abstract_declarator '(' parameter_type_list ')'		{DisplayProd(" direct_abstract_declarator -> direct_abstract_declarator '(' parameter_type_list ')'"); }
	;

initializer
	: assignment_expression				{DisplayProd(" initializer -> assignment_expression"); }
	| '{' initializer_list '}'			{DisplayProd(" initializer -> '{' initializer_list '}'"); }
	| '{' initializer_list ',' '}'		{DisplayProd(" initializer -> '{' initializer_list ',' '}'"); }
	;

initializer_list
	: initializer										{DisplayProd(" initializer_list -> initializer"); }
	| designation initializer							{DisplayProd(" initializer_list -> designation initializer"); }
	| initializer_list ',' initializer					{DisplayProd(" initializer_list -> initializer_list ',' initializer"); }
	| initializer_list ',' designation initializer		{DisplayProd(" initializer_list -> initializer_list ',' designation initializer"); }
	;

designation
	: designator_list '='		{DisplayProd(" designation -> designator_list '='"); }
	;

designator_list
	: designator					{DisplayProd(" designator_list -> designator"); }
	| designator_list designator	{DisplayProd(" designator_list -> designator_list designator"); }
	;

designator
	: '[' constant_expression ']'	{DisplayProd(" designator -> '[' constant_expression ']'"); }
	| '.' IDENTIFIER				{DisplayProd(" designator -> '.' IDENTIFIER"); }
	;

statement
	: labeled_statement			{DisplayProd(" statement -> labeled_statement"); }
	| compound_statement		{DisplayProd(" statement -> compound_statement"); }
	| expression_statement		{DisplayProd(" statement -> expression_statement"); }
	| selection_statement		{DisplayProd(" statement -> selection_statement"); }
	| iteration_statement		{DisplayProd(" statementr -> iteration_statement"); }
	| jump_statement			{DisplayProd(" statement -> jump_statement"); }
	;

labeled_statement
	: IDENTIFIER ':' statement					{DisplayProd(" labeled_statement -> IDENTIFIER ':' statement"); }
	| CASE constant_expression ':' statement	{DisplayProd(" labeled_statement -> CASE constant_expression ':' statement"); }
	| DEFAULT ':' statement						{DisplayProd(" labeled_statement -> DEFAULT ':' statement"); }
	;

compound_statement
	: '{' '}'					{DisplayProd(" compound_statement -> '{' '}'"); }
	| '{' block_item_list '}'	{DisplayProd(" compound_statement -> '{' block_item_list '}'"); }
	;

block_item_list
	: block_item					{DisplayProd(" block_item_list -> block_item"); }
	| block_item_list block_item	{DisplayProd(" block_item_list -> block_item_list block_item"); }
	;

block_item
	: declaration		{DisplayProd(" block_item -> declaration"); }
	| statement			{DisplayProd(" block_item -> statement"); }
	;

expression_statement
	: ';'				{DisplayProd(" expression_statement -> ';'"); }
	| expression ';'	{DisplayProd(" expression_statement -> expression ';'"); }
	;

selection_statement
	: IF '(' expression ')' statement						{DisplayProd(" selection_statement -> IF '(' expression ')' statement"); }
	| IF '(' expression ')' statement ELSE statement		{DisplayProd(" selection_statement -> IF '(' expression ')' statement ELSE statement"); }
	| SWITCH '(' expression ')' statement					{DisplayProd(" selection_statement -> SWITCH '(' expression ')' statement"); }
	;

iteration_statement
	: WHILE '(' expression ')' statement											{DisplayProd(" iteration_statement -> WHILE '(' expression ')' statement"); }
	| DO statement WHILE '(' expression ')' ';'										{DisplayProd(" iteration_statement -> DO statement WHILE '(' expression ')' ';'"); }
	| FOR '(' expression_statement expression_statement ')' statement				{DisplayProd(" iteration_statement -> FOR '(' expression_statement expression_statement ')' statement"); }
	| FOR '(' expression_statement expression_statement expression ')' statement	{DisplayProd(" iteration_statement -> FOR '(' expression_statement expression_statement expression ')' statement"); }
	| FOR '(' declaration expression_statement ')' statement						{DisplayProd(" iteration_statement -> FOR '(' declaration expression_statement ')' statement"); }
	| FOR '(' declaration expression_statement expression ')' statement				{DisplayProd(" iteration_statement -> FOR '(' declaration expression_statement expression ')' statement"); }
	;

jump_statement
	: GOTO IDENTIFIER ';'		{DisplayProd(" jump_statement -> GOTO IDENTIFIER ';'"); }
	| CONTINUE ';'				{DisplayProd(" jump_statement -> CONTINUE ';'"); }
	| BREAK ';'					{DisplayProd(" jump_statement -> BREAK ';'"); }
	| RETURN ';'				{DisplayProd(" jump_statement -> RETURN ';'"); }
	| RETURN expression ';'		{DisplayProd(" jump_statement -> RETURN expression ';'"); }
	;

translation_unit
	: external_declaration						{ ClrIdList(); DisplayProd(" translation_unit -> external_declaration"); }
	| translation_unit external_declaration		{ ClrIdList(); DisplayProd(" translation_unit -> translation_unit external_declaration"); }
	;

external_declaration
	: function_definition		{DisplayProd(" external_declaration -> function_definition"); }
	| declaration				{DisplayProd(" external_declaration -> declaration"); }
	;

function_definition
	: declaration_specifiers declarator declaration_list compound_statement			{DisplayProd(" function_definition -> declaration_specifiers declarator declaration_list compound_statement"); }
	| declaration_specifiers declarator compound_statement							{DisplayProd(" function_definition -> declaration_specifiers declarator compound_statement"); }
	;

declaration_list
	: declaration						{DisplayProd(" declaration_list -> declaration"); }
	| declaration_list declaration		{DisplayProd(" declaration_list -> declaration_list declaration"); }
	;


%%
#include <stdio.h>


//
// display the parser productions generated
//
void DisplayProd(string cs) {

#ifdef DISPLAY_PROD
	parser->DisplayProd(cs);
#endif
}

//
// change this symbol to a TYPE_NAME 
//
void SetTypeName(YYSTYPE sym) {

symbl *pSym = (symbl *)sym;
	
	parser->setTypeName(pSym);
}

//
// add a symbol to the IdList
//
void AddIdToList(YYSTYPE sym) {

symbl *pSym = (symbl *)sym;

	parser->AddIdToList(pSym);
}


//
// clear out the IdList
//
void ClrIdList(void) {
	parser->ClrIdList();
}


//
// update all of the symbols in the IdList to TYPE_NAME
//
void UpdateTypeNames(YYSTYPE tok) {

if ( (tok == -1) || (tok == 0) ) {
	return;
}

	symbl *pSym = (symbl *)tok;
	UINT32 token = pSym->getToken();

	if ( (token == TYPEDEF)) {
		parser->UpdateTypeNames();
		parser->ClrIdList();		
	}
}

//
// get a pointer to a symbol having this token
//
// This is primarily used to find internal tokens
//
YYSTYPE GetSymbol(YYSTYPE tok) {

	UINT32 token = (UINT32)tok;
	symbl *sym = parser->getSymbol(token);

	return (YYSTYPE)sym;	
}


//
// display the lexem for this symbol
//
void DisplayLexeme(YYSTYPE sym) {

string cs;

	if ( (sym == -1) || (sym == 0) ) {
		return;
	}
	symbl *pSym = (symbl *)sym;
	parser->DisplaySymbol(pSym);
}	
















