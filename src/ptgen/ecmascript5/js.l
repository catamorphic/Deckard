DecimalDigit [0-9]
DecimalDigits [0-9]+
NonZeroDigit [1-9]
OctalDigit [0-7]
HexDigit [0-9a-fA-F]
IdentifierStart [$_a-zA-Z]|("\\"[u]{HexDigit}{4})
IdentifierPart {IdentifierStart}|[0-9]
Identifier {IdentifierStart}{IdentifierPart}*
ExponentIndicator [eE]
SignedInteger [+-]?[0-9]+
DecimalIntegerLiteral [0]|({NonZeroDigit}{DecimalDigits}*)
ExponentPart {ExponentIndicator}{SignedInteger}
OctalIntegerLiteral [0]{OctalDigit}+
HexIntegerLiteral [0][xX]{HexDigit}+
DecimalLiteral ({DecimalIntegerLiteral}\.{DecimalDigits}*{ExponentPart}?)|(\.{DecimalDigits}{ExponentPart}?)|({DecimalIntegerLiteral}{ExponentPart}?)
LineContinuation \\(\r\n|\r|\n)
OctalEscapeSequence (?:[1-7][0-7]{0,2}|[0-7]{2,3})
HexEscapeSequence [x]{HexDigit}{2}
SingleEscapeCharacter [\'\"\\bfnrtv]
NonEscapeCharacter [^\'\"\\bfnrtv0-9xu]
CharacterEscapeSequence {SingleEscapeCharacter}|{NonEscapeCharacter}
EscapeSequence {CharacterEscapeSequence}|{OctalEscapeSequence}|{HexEscapeSequence}
DoubleStringCharacter ([^\"\\\n\r]+)|(\\{EscapeSequence})|{LineContinuation}
SingleStringCharacter ([^\'\\\n\r]+)|(\\{EscapeSequence})|{LineContinuation}
StringLiteral (\"{DoubleStringCharacter}*\")|(\'{SingleStringCharacter}*\')
RegularExpressionNonTerminator [^\n\r]
RegularExpressionBackslashSequence \\{RegularExpressionNonTerminator}
RegularExpressionClassChar [^\n\r\]\\]|{RegularExpressionBackslashSequence}
RegularExpressionClass \[{RegularExpressionClassChar}*\]
RegularExpressionFlags {IdentifierPart}*
RegularExpressionFirstChar ([^\n\r\*\\\/\[])|{RegularExpressionBackslashSequence}|{RegularExpressionClass}
RegularExpressionChar ([^\n\r\\\/\[])|{RegularExpressionBackslashSequence}|{RegularExpressionClass}
RegularExpressionBody {RegularExpressionFirstChar}{RegularExpressionChar}*
RegularExpressionLiteral {RegularExpressionBody}\/{RegularExpressionFlags}

%{
#include <stdio.h>
#include <ptree.h>
#include "pt_js.tab.hh"
#include <map>
#include <string>
using namespace std;

extern map<string,int> name2id;
void count();
void comment();
void cpp_comment();

// TODO: potential troublesome global variables
int column = 0;
int line = 1;

#define YY_DECL int yylex(YYSTYPE *yylvalp)

%}

%% 
"/*"      { count(); comment();}
"//"      { count(); cpp_comment(); }
"break" {count();yylvalp->t=new Terminal(name2id["BREAK"],yytext,line);return (BREAK);}
"case" {count();yylvalp->t=new Terminal(name2id["CASE"],yytext,line);return (CASE);}
"catch" {count();yylvalp->t=new Terminal(name2id["CATCH"],yytext,line);return (CATCH);}
"continue" {count();yylvalp->t=new Terminal(name2id["CONTINUE"],yytext,line);return (CONTINUE);}
"debugger" {count();yylvalp->t=new Terminal(name2id["DEBUGGER"],yytext,line);return (DEBUGGER);}
"default" {count();yylvalp->t=new Terminal(name2id["DEFAULT"],yytext,line);return (DEFAULT);}
"delete" {count();yylvalp->t=new Terminal(name2id["DELETE"],yytext,line);return (DELETE);}
"do" {count();yylvalp->t=new Terminal(name2id["DO"],yytext,line);return (DO);}
"else" {count();yylvalp->t=new Terminal(name2id["ELSE"],yytext,line);return (ELSE);}
"finally" {count();yylvalp->t=new Terminal(name2id["FINALLY"],yytext,line);return (FINALLY);}
"for" {count();yylvalp->t=new Terminal(name2id["FOR"],yytext,line);return (FOR);}
"function" {count();yylvalp->t=new Terminal(name2id["FUNCTION"],yytext,line);return (FUNCTION);}
"if" {count();yylvalp->t=new Terminal(name2id["IF"],yytext,line);return (IF);}
"in" {count();yylvalp->t=new Terminal(name2id["IN"],yytext,line);return (IN);}
"instanceof" {count();yylvalp->t=new Terminal(name2id["INSTANCEOF"],yytext,line);return (INSTANCEOF);}
"new" {count();yylvalp->t=new Terminal(name2id["NEW"],yytext,line);return (NEW);}
"return" {count();yylvalp->t=new Terminal(name2id["RETURN"],yytext,line);return (RETURN);}
"switch" {count();yylvalp->t=new Terminal(name2id["SWITCH"],yytext,line);return (SWITCH);}
"this" {count();yylvalp->t=new Terminal(name2id["THIS"],yytext,line);return (THIS);}
"throw" {count();yylvalp->t=new Terminal(name2id["THROW"],yytext,line);return (THROW);}
"try" {count();yylvalp->t=new Terminal(name2id["TRY"],yytext,line);return (TRY);}
"typeof" {count();yylvalp->t=new Terminal(name2id["TYPEOF"],yytext,line);return (TYPEOF);}
"var" {count();yylvalp->t=new Terminal(name2id["VAR"],yytext,line);return (VAR);}
"void" {count();yylvalp->t=new Terminal(name2id["VOID"],yytext,line);return (VOID);}
"while" {count();yylvalp->t=new Terminal(name2id["WHILE"],yytext,line);return (WHILE);}
"with" {count();yylvalp->t=new Terminal(name2id["WITH"],yytext,line);return (WITH);}
"class" {count();yylvalp->t=new Terminal(name2id["CLASS"],yytext,line);return (CLASS);}
"const" {count();yylvalp->t=new Terminal(name2id["CONST"],yytext,line);return (CONST);}
"enum" {count();yylvalp->t=new Terminal(name2id["ENUM"],yytext,line);return (ENUM);}
"export" {count();yylvalp->t=new Terminal(name2id["EXPORT"],yytext,line);return (EXPORT);} 
"extends" {count();yylvalp->t=new Terminal(name2id["EXTENDS"],yytext,line);return (EXTENDS);}
"import" {count();yylvalp->t=new Terminal(name2id["IMPORT"],yytext,line);return (IMPORT);}
"super" {count();yylvalp->t=new Terminal(name2id["SUPER"],yytext,line);return (SUPER);}
"implements" {count();yylvalp->t=new Terminal(name2id["IMPLEMENTS"],yytext,line);return (IMPLEMENTS);}
"interface" {count();yylvalp->t=new Terminal(name2id["INTERFACE"],yytext,line);return (INTERFACE);}
"let" {count();yylvalp->t=new Terminal(name2id["LET"],yytext,line);return (LET);} 
"package" {count();yylvalp->t=new Terminal(name2id["PACKAGE"],yytext,line);return (PACKAGE);}
"private" {count();yylvalp->t=new Terminal(name2id["PRIVATE"],yytext,line);return (PRIVATE);}
"protected" {count();yylvalp->t=new Terminal(name2id["PROTECTED"],yytext,line);return (PROTECTED);} 
"public" {count();yylvalp->t=new Terminal(name2id["PUBLIC"],yytext,line);return (PUBLIC);}
"static" {count();yylvalp->t=new Terminal(name2id["STATIC"],yytext,line);return (STATIC);}
"yield" {count();yylvalp->t=new Terminal(name2id["YIELD"],yytext,line);return (YIELD);}
"{" {count();yylvalp->t=new Terminal(name2id["LBRACE"],yytext,line);return (LBRACE);}
"}" {count();yylvalp->t=new Terminal(name2id["RBRACE"],yytext,line);return (RBRACE);}
"(" {count();yylvalp->t=new Terminal(name2id["LPAREN"],yytext,line);return (LPAREN);}
")" {count();yylvalp->t=new Terminal(name2id["RPAREN"],yytext,line);return (RPAREN);}
"[" {count();yylvalp->t=new Terminal(name2id["LBRACK"],yytext,line);return (LBRACK);}
"]" {count();yylvalp->t=new Terminal(name2id["RBRACK"],yytext,line);return (RBRACK);}
"." {count();yylvalp->t=new Terminal(name2id["DOT"],yytext,line);return (DOT);}
";" {count();yylvalp->t=new Terminal(name2id["SEMI"],yytext,line);return (SEMI);}
"," {count();yylvalp->t=new Terminal(name2id["COMMA"],yytext,line);return (COMMA);}
"<" {count();yylvalp->t=new Terminal(name2id["LT"],yytext,line);return (LT);}
">" {count();yylvalp->t=new Terminal(name2id["GT"],yytext,line);return (GT);}
"<=" {count();yylvalp->t=new Terminal(name2id["LTE"],yytext,line);return (LTE);}
">=" {count();yylvalp->t=new Terminal(name2id["GTE"],yytext,line);return (GTE);}
"==" {count();yylvalp->t=new Terminal(name2id["EQ2"],yytext,line);return (EQ2);}
"!=" {count();yylvalp->t=new Terminal(name2id["NOT_EQ"],yytext,line);return (NOT_EQ);}
"===" {count();yylvalp->t=new Terminal(name2id["EQ3"],yytext,line);return (EQ3);}
"!==" {count();yylvalp->t=new Terminal(name2id["NOT_EQ2"],yytext,line);return (NOT_EQ2);}
"+" {count();yylvalp->t=new Terminal(name2id["PLUS"],yytext,line);return (PLUS);}
"-" {count();yylvalp->t=new Terminal(name2id["MINUS"],yytext,line);return (MINUS);}
"*" {count();yylvalp->t=new Terminal(name2id["TIMES"],yytext,line);return (TIMES);}
"%" {count();yylvalp->t=new Terminal(name2id["PERCENT"],yytext,line);return (PERCENT);}
"++" {count();yylvalp->t=new Terminal(name2id["PLUS2"],yytext,line);return (PLUS2);}
"--" {count();yylvalp->t=new Terminal(name2id["MINUS2"],yytext,line);return (MINUS2);}
"<<" {count();yylvalp->t=new Terminal(name2id["LSHIFT"],yytext,line);return (LSHIFT);}
">>" {count();yylvalp->t=new Terminal(name2id["RSHIFT"],yytext,line);return (RSHIFT);}
">>>" {count();yylvalp->t=new Terminal(name2id["GT3"],yytext,line);return (GT3);}
"&" {count();yylvalp->t=new Terminal(name2id["AMPER"],yytext,line);return (AMPER);}
"|" {count();yylvalp->t=new Terminal(name2id["PIPE"],yytext,line);return (PIPE);}
"^" {count();yylvalp->t=new Terminal(name2id["CARET"],yytext,line);return (CARET);}
"!" {count();yylvalp->t=new Terminal(name2id["EXCLAMATION"],yytext,line);return (EXCLAMATION);}
"~" {count();yylvalp->t=new Terminal(name2id["TILDE"],yytext,line);return (TILDE);}
"&&" {count();yylvalp->t=new Terminal(name2id["AMPER2"],yytext,line);return (AMPER2);}
"||" {count();yylvalp->t=new Terminal(name2id["PIPE2"],yytext,line);return (PIPE2);}
"?" {count();yylvalp->t=new Terminal(name2id["QUESTION"],yytext,line);return (QUESTION);}
":" {count();yylvalp->t=new Terminal(name2id["COLON"],yytext,line);return (COLON);}
"=" {count();yylvalp->t=new Terminal(name2id["EQ"],yytext,line);return (EQ);}
"+=" {count();yylvalp->t=new Terminal(name2id["PLUS_EQ"],yytext,line);return (PLUS_EQ);}
"-=" {count();yylvalp->t=new Terminal(name2id["MINUS_EQ"],yytext,line);return (MINUS_EQ);}
"*=" {count();yylvalp->t=new Terminal(name2id["TIMES_EQ"],yytext,line);return (TIMES_EQ);}
"%=" {count();yylvalp->t=new Terminal(name2id["PERCENT_EQ"],yytext,line);return (PERCENT_EQ);}
"<<=" {count();yylvalp->t=new Terminal(name2id["LSHIFT_EQ"],yytext,line);return (LSHIFT_EQ);}
">>=" {count();yylvalp->t=new Terminal(name2id["RSHIFT_EQ"],yytext,line);return (RSHIFT_EQ);}
">>>=" {count();yylvalp->t=new Terminal(name2id["GT3_EQ"],yytext,line);return (GT3_EQ);}
"&=" {count();yylvalp->t=new Terminal(name2id["AMPER_EQ"],yytext,line);return (AMPER_EQ);}
"|=" {count();yylvalp->t=new Terminal(name2id["PIPE_EQ"],yytext,line);return (PIPE_EQ);}
"^=" {count();yylvalp->t=new Terminal(name2id["CARET_EQ"],yytext,line);return (CARET_EQ);}
"/" {count();yylvalp->t=new Terminal(name2id["DIVIDE"],yytext,line);return (DIVIDE);}
"/=" {count();yylvalp->t=new Terminal(name2id["DIVIDE_EQ"],yytext,line);return (DIVIDE_EQ);}
"null" {count();yylvalp->t=new Terminal(name2id["NUL"],yytext,line);return (NUL);}
"true" {count();yylvalp->t=new Terminal(name2id["TRU"],yytext,line);return (TRU);}
"false" {count();yylvalp->t=new Terminal(name2id["FALS"],yytext,line);return (FALS);}
{StringLiteral} {count();yylvalp->t=new Terminal(name2id["STRING_LITERAL"],yytext,line);return(STRING_LITERAL); }
{Identifier} {count();yylvalp->t=new Terminal(name2id["IDENTIFIER"],yytext,line);return(IDENTIFIER); }
{DecimalLiteral} {count();yylvalp->t=new Terminal(name2id["NUMERIC_LITERAL"],yytext,line);return(NUMERIC_LITERAL); }
{HexIntegerLiteral} {count();yylvalp->t=new Terminal(name2id["NUMERIC_LITERAL"],yytext,line);return(NUMERIC_LITERAL); }
{OctalIntegerLiteral} {count();yylvalp->t=new Terminal(name2id["NUMERIC_LITERAL"],yytext,line);return(NUMERIC_LITERAL); } 
([ \t\v\n\r])+ {count();}
. {count();} 
%% 

int yywrap()
{
  return(1);
}

void comment()
{
  int c;

  for (;;) {
    while ( (c = yyinput()) != '*' && c != EOF ) {
      if (c=='\n') {
        line++;column=0;
      } else {
        column++;
      }
    }

                if ( c == '*' ) {
      while ( (c = yyinput()) == '*' )
        column++;
      column++;
      if (c =='\n') {line++;column=0;}
      if ( c == '/' )
        break;
    }

                if ( c == EOF ) {
      break;  
    }
            }
}

void cpp_comment()
{
  int c;
  while ((c = yyinput()) != '\n' && c != 0 && c!=EOF)
    column++;
  line++;
  column= 0;
}

void count()
{
  int i;

  for (i = 0; yytext[i] != '\0'; i++)
    if (yytext[i] == '\n') {
      column = 0;
      line++;
    } else if (yytext[i] == '\t')
      column += 4;
    else
      column++;

  //ECHO;
}