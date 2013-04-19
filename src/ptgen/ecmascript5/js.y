
statement
    : block
    | variable_statement
    | empty_statement
    | expression_statement
    | if_statement
    | iteration_statement
    | continue_statement
    | break_statement
    | return_statement
    | with_statement
    | labelled_statement
    | switch_statement
    | throw_statement
    | try_statement
    | debugger_statement
    ;

block
    : LBRACE statement_list RBRACE
        {
        }
    ;

statement_list
    : statement_list statement
        {
        }
    |
        {
        }
    ;

variable_statement
    : VAR variable_declaration_list
        {
        }
    ;

variable_declaration_list
    : variable_declaration
        {
        }
    | variable_declaration_list COMMA variable_declaration
        {
        }
    ;

variable_declaration_list_no_in
    : variable_declaration_list_no_in
        {
        }
    | variable_declaration_list_no_in , variable_declaration_no_in
        {
        }
    ;

variable_declaration
    : IDENTIFIER
        {
        }
    | IDENTIFIER initializer
        {
        }
    ;

variable_declaration_no_in
    : IDENTIFIER
        {
        }
    | IDENTIFIER initializer_no_in
        {
        }
    ;

initializer
    : EQ assignment_expression
        {
        }
    ;

initializer_no_in
    : EQ assignment_expression_no_in
        {
        }
    ;

empty_statement
    : SEMI
        {
        }
    ;

expression_statement
    : expression_no_bf ;
        {
        }
    | expression_no_bf error
        {
        }
    ;

if_statement
    : IF LPAREN expression RPAREN statement
        {
        }
    | IF LPAREN expression RPAREN statement ELSE statement
        {
        }
    ;

iteration_statement
    : DO statement WHILE LPAREN expression RPAREN SEMI
        {
        }
    | DO statement WHILE LPAREN expression RPAREN error
        {
        }
    | WHILE LPAREN expression RPAREN statement
        {
        }
    | FOR LPAREN expression_no_in SEMI expression SEMI expression RPAREN statement
        {
        }
    | FOR LPAREN expression_no_in SEMI expression SEMI RPAREN statement
        {
        }
    | FOR LPAREN expression_no_in SEMI SEMI expression RPAREN statement
        {
        }
    | FOR LPAREN expression_no_in SEMI SEMI RPAREN statement
        {
        }
    | FOR LPAREN SEMI expression SEMI expression RPAREN statement
        {
        }
    | FOR LPAREN SEMI expression SEMI RPAREN statement
        {
        }
    | FOR LPAREN SEMI SEMI expression RPAREN statement
        {
        }
    | FOR LPAREN SEMI SEMI RPAREN statement
        {
        }
    | FOR LPAREN VAR variable_declaration_list_no_in SEMI expression SEMI expression RPAREN statement
        {
        }
    | FOR LPAREN VAR variable_declaration_list_no_in ; expression ; RPAREN statement
        {
        }
    | FOR LPAREN VAR variable_declaration_list_no_in ; ; expression RPAREN statement
        {
        }
    | FOR LPAREN VAR variable_declaration_list_no_in ; ; RPAREN statement
        {
        }
    | FOR LPAREN left_hand_side_expression IN expression RPAREN statement
        {
        }
    | FOR LPAREN VAR variable_declaration_no_in IN expression RPAREN statement
        {
        }
    ;

continue_statement
    : CONTINUE SEMI
        {
        }
    | CONTINUE error
        {
        }
    | CONTINUE IDENTIFIER SEMI
        {
        }
    | CONTINUE IDENTIFIER error
        {
        }
    ;

break_statement
    : BREAK SEMI
        {
        }
    | BREAK error
        {
        }
    | BREAK IDENTIFIER SEMI
        {
        }
    | BREAK IDENTIFIER error
        {
        }
    ;

return_statement
    : RETURN SEMI
        {
        }
    | RETURN error
        {
        }
    | RETURN expression SEMI
        {
        }
    | RETURN expression error
        {
        }
    ;

with_statement
    : WITH LPAREN expression RPAREN statement
        {
        }
    ;

switch_statement
    : SWITCH LPAREN expression RPAREN case_block
        {
        }
    ;

case_block
    : { case_clases }
        {
        }
    | { case_clases default_clause case_clases }
        {
        }
    ;

case_clases
    : case_clases case_clause
        {
        }
    |
        {
        }
    ;

case_clause
    : CASE expression COLON statement_list
        {
        }
    ;

default_clause
    : DEFAULT COLON statement_list
        {
        }
    ;

labelled_statement
    : IDENTIFIER COLON statement
        {
        }
    ;

throw_statement
    : THROW expression ;
        {
        }
    | THROW expression error
        {
        }
    ;

try_statement
    : TRY block catch
        {
        }
    | TRY block finally
        {
        }
    | TRY block catch finally
        {
        }
    ;

catch
    : CATCH LPAREN IDENTIFIER RPAREN block
        {
        }
    ;

finally
    : FINALLY block
        {
        }
    ;

debugger_statement
    : DEBUGGER ;
        {
        }
    | DEBUGGER error
        {
        }
    ;

function_declaration
    : FUNCTION IDENTIFIER LPAREN RPAREN { function_body }
        {
        }
    | FUNCTION IDENTIFIER LPAREN FormalParameterList RPAREN { function_body }
        {
        }
    ;

FunctionExpression
    : FUNCTION IDENTIFIER LPAREN RPAREN { function_body }
        {
        }
    | FUNCTION IDENTIFIER LPAREN FormalParameterList RPAREN { function_body }
        {
        }
    | FUNCTION LPAREN RPAREN { function_body }
        {
        }
    | FUNCTION LPAREN FormalParameterList RPAREN { function_body }
        {
        }
    ;

FormalParameterList
    : IDENTIFIER
        {
        }
    | FormalParameterList , IDENTIFIER
        {
        }
    ;

function_body
    : SourceElements
    ;

Program
    : SourceElements EOF
        {
        }
    ;

SourceElements
    : SourceElements SourceElement
        {
        }
    |
        {
        }
    ;

SourceElement
    : statement
    | function_declaration
    ;

PrimaryExpression
    : PrimaryExpressionNoBrace
    | ObjectLiteral
    ;

PrimaryExpressionNoBrace
    : THIS
        {
        }
    | IDENTIFIER
        {
        }
    | Literal
    | ArrayLiteral
    | LPAREN expression RPAREN
        {
        }
    ;

ArrayLiteral
    : [ ]
        {
        }
    | [ Elision ]
        {
        }
    | [ ElementList ]
        {
        }
    | [ ElementList , ]
        {
        }
    | [ ElementList , Elision ]
        {
        }
    ;

ElementList
    : AssignmentExpression
        {
        }
    | Elision AssignmentExpression
        {
        }
    | ElementList , AssignmentExpression
        {
        }
    | ElementList , Elision AssignmentExpression
        {
        }
    ;

Elision
    : ,
        {
        }
    | Elision ,
        {
        }
    ;

ObjectLiteral
    : { }
        {
        }
    | { PropertyNameAndValueList }
        {
        }
    | { PropertyNameAndValueList , }
        {
        }
    ;

PropertyNameAndValueList
    : PropertyAssignment
        {
        }
    | PropertyNameAndValueList , PropertyAssignment
        {
        }
    ;

PropertyAssignment
    : PropertyName : AssignmentExpression
        {
        }
    | IDENTIFIER PropertyName LPAREN RPAREN { function_body }
        {
        }
    | IDENTIFIER PropertyName LPAREN PropertySetParameterList RPAREN { function_body }
        {
        }
    ;

PropertyName
    : IdentifierName
    | StringLiteral
    | NumericLiteral
    ;

PropertySetParameterList
    : IDENTIFIER
        {
        }
    ;

MemberExpression
    : PrimaryExpression
    | FunctionExpression
    | MemberExpression [ expression ]
        {
        }
    | MemberExpression . IdentifierName
        {
        }
    | NEW MemberExpression Arguments
        {
        }
    ;

MemberExpressionNoBF
    : PrimaryExpressionNoBrace
    | MemberExpressionNoBF [ expression ]
        {
        }
    | MemberExpressionNoBF . IdentifierName
        {
        }
    | NEW MemberExpression Arguments
        {
        }
    ;

NewExpression
    : MemberExpression
    | NEW NewExpression
        {
        }
    ;

NewExpressionNoBF
    : MemberExpressionNoBF
    | NEW NewExpression
        {
        }
    ;

CallExpression
    : MemberExpression Arguments
        {
        }
    | CallExpression Arguments
        {
        }
    | CallExpression [ expression ]
        {
        }
    | CallExpression . IdentifierName
        {
        }
    ;

CallExpressionNoBF
    : MemberExpressionNoBF Arguments
        {
        }
    | CallExpressionNoBF Arguments
        {
        }
    | CallExpressionNoBF [ expression ]
        {
        }
    | CallExpressionNoBF . IdentifierName
        {
        }
    ;

IdentifierName
    : IDENTIFIER
        {
        }
    | ReservedWord
        {
        }
    ;

Arguments
    : LPAREN RPAREN
        {
        }
    | LPAREN ArgumentList RPAREN
        {
        }
    ;

ArgumentList
    : AssignmentExpression
        {
        }
    | ArgumentList , AssignmentExpression
        {
        }
    ;

left_hand_side_expression
    : NewExpression
    | CallExpression
    ;

LeftHandSideExpressionNoBF
    : NewExpressionNoBF
    | CallExpressionNoBF
    ;

PostfixExpression
    : left_hand_side_expression
    | left_hand_side_expression ++
        {
        }
    | left_hand_side_expression --
        {
        }
    ;

PostfixExpressionNoBF
    : LeftHandSideExpressionNoBF
    | LeftHandSideExpressionNoBF ++
        {
        }
    | LeftHandSideExpressionNoBF --
        {
        }
    ;

UnaryExpression
    : PostfixExpression
    | UnaryExpr
    ;

UnaryExpressionNoBF
    : PostfixExpressionNoBF
    | UnaryExpr
    ;

UnaryExpr
    : DELETE UnaryExpression
        {
        }
    | VOID UnaryExpression
        {
        }
    | TYPEOF UnaryExpression
        {
        }
    | BR++ UnaryExpression
        {
        }
    | BR-- UnaryExpression
        {
        }
    | ++ UnaryExpression
        {
        }
    | -- UnaryExpression
        {
        }
    | + UnaryExpression
        {
        }
    | - UnaryExpression
        {
        }
    | ~ UnaryExpression
        {
        }
    | ! UnaryExpression
        {
        }
    ;

MultiplicativeExpression
    : UnaryExpression
    | MultiplicativeExpression * UnaryExpression
        {
        }
    | MultiplicativeExpression / UnaryExpression
        {
        }
    | MultiplicativeExpression % UnaryExpression
        {
        }
    ;

MultiplicativeExpressionNoBF
    : UnaryExpressionNoBF
    | MultiplicativeExpressionNoBF * UnaryExpression
        {
        }
    | MultiplicativeExpressionNoBF / UnaryExpression
        {
        }
    | MultiplicativeExpressionNoBF % UnaryExpression
        {
        }
    ;

AdditiveExpression
    : MultiplicativeExpression
    | AdditiveExpression + MultiplicativeExpression
        {
        }
    | AdditiveExpression - MultiplicativeExpression
        {
        }
    ;

AdditiveExpressionNoBF
    : MultiplicativeExpressionNoBF
    | AdditiveExpressionNoBF + MultiplicativeExpression
        {
        }
    | AdditiveExpressionNoBF - MultiplicativeExpression
        {
        }
    ;

ShiftExpression
    : AdditiveExpression
    | ShiftExpression << AdditiveExpression
        {
        }
    | ShiftExpression >> AdditiveExpression
        {
        }
    | ShiftExpression >>> AdditiveExpression
        {
        }
    ;

ShiftExpressionNoBF
    : AdditiveExpressionNoBF
    | ShiftExpressionNoBF << AdditiveExpression
        {
        }
    | ShiftExpressionNoBF >> AdditiveExpression
        {
        }
    | ShiftExpressionNoBF >>> AdditiveExpression
        {
        }
    ;

RelationalExpression
    : ShiftExpression
    | RelationalExpression < ShiftExpression
        {
        }
    | RelationalExpression > ShiftExpression
        {
        }
    | RelationalExpression <= ShiftExpression
        {
        }
    | RelationalExpression >= ShiftExpression
        {
        }
    | RelationalExpression INSTANCEOF ShiftExpression
        {
        }
    | RelationalExpression IN ShiftExpression
        {
        }
    ;

RelationalExpressionNoIn
    : ShiftExpression
    | RelationalExpressionNoIn < ShiftExpression
        {
        }
    | RelationalExpressionNoIn > ShiftExpression
        {
        }
    | RelationalExpressionNoIn <= ShiftExpression
        {
        }
    | RelationalExpressionNoIn >= ShiftExpression
        {
        }
    | RelationalExpressionNoIn INSTANCEOF ShiftExpression
        {
        }
    ;

RelationalExpressionNoBF
    : ShiftExpressionNoBF
    | RelationalExpressionNoBF < ShiftExpression
        {
        }
    | RelationalExpressionNoBF > ShiftExpression
        {
        }
    | RelationalExpressionNoBF <= ShiftExpression
        {
        }
    | RelationalExpressionNoBF >= ShiftExpression
        {
        }
    | RelationalExpressionNoBF INSTANCEOF ShiftExpression
        {
        }
    | RelationalExpressionNoBF IN ShiftExpression
        {
        }
    ;

EqualityExpression
    : RelationalExpression
    | EqualityExpression == RelationalExpression
        {
        }
    | EqualityExpression != RelationalExpression
        {
        }
    | EqualityExpression === RelationalExpression
        {
        }
    | EqualityExpression !== RelationalExpression
        {
        }
    ;

EqualityExpressionNoIn
    : RelationalExpressionNoIn
    | EqualityExpressionNoIn == RelationalExpressionNoIn
        {
        }
    | EqualityExpressionNoIn != RelationalExpressionNoIn
        {
        }
    | EqualityExpressionNoIn === RelationalExpressionNoIn
        {
        }
    | EqualityExpressionNoIn !== RelationalExpressionNoIn
        {
        }
    ;

EqualityExpressionNoBF
    : RelationalExpressionNoBF
    | EqualityExpressionNoBF == RelationalExpression
        {
        }
    | EqualityExpressionNoBF != RelationalExpression
        {
        }
    | EqualityExpressionNoBF === RelationalExpression
        {
        }
    | EqualityExpressionNoBF !== RelationalExpression
        {
        }
    ;

BitwiseANDExpression
    : EqualityExpression
    | BitwiseANDExpression & EqualityExpression
        {
        }
    ;

BitwiseANDExpressionNoIn
    : EqualityExpressionNoIn
    | BitwiseANDExpressionNoIn & EqualityExpressionNoIn
        {
        }
    ;

BitwiseANDExpressionNoBF
    : EqualityExpressionNoBF
    | BitwiseANDExpressionNoBF & EqualityExpression
        {
        }
    ;

BitwiseXORExpression
    : BitwiseANDExpression
    | BitwiseXORExpression ^ BitwiseANDExpression
        {
        }
    ;

BitwiseXORExpressionNoIn
    : BitwiseANDExpressionNoIn
    | BitwiseXORExpressionNoIn ^ BitwiseANDExpressionNoIn
        {
        }
    ;

BitwiseXORExpressionNoBF
    : BitwiseANDExpressionNoBF
    | BitwiseXORExpressionNoBF ^ BitwiseANDExpression
        {
        }
    ;

BitwiseORExpression
    : BitwiseXORExpression
    | BitwiseORExpression | BitwiseXORExpression
        {
        }
    ;

BitwiseORExpressionNoIn
    : BitwiseXORExpressionNoIn
    | BitwiseORExpressionNoIn | BitwiseXORExpressionNoIn
        {
        }
    ;

BitwiseORExpressionNoBF
    : BitwiseXORExpressionNoBF
    | BitwiseORExpressionNoBF | BitwiseXORExpression
        {
        }
    ;

LogicalANDExpression
    : BitwiseORExpression
    | LogicalANDExpression && BitwiseORExpression
        {
        }
    ;

LogicalANDExpressionNoIn
    : BitwiseORExpressionNoIn
    | LogicalANDExpressionNoIn && BitwiseORExpressionNoIn
        {
        }
    ;

LogicalANDExpressionNoBF
    : BitwiseORExpressionNoBF
    | LogicalANDExpressionNoBF && BitwiseORExpression
        {
        }
    ;

LogicalORExpression
    : LogicalANDExpression
    | LogicalORExpression || LogicalANDExpression
        {
        }
    ;

LogicalORExpressionNoIn
    : LogicalANDExpressionNoIn
    | LogicalORExpressionNoIn || LogicalANDExpressionNoIn
        {
        }
    ;

LogicalORExpressionNoBF
    : LogicalANDExpressionNoBF
    | LogicalORExpressionNoBF || LogicalANDExpression
        {
        }
    ;

ConditionalExpression
    : LogicalORExpression
    | LogicalORExpression ? AssignmentExpression : AssignmentExpression
        {
        }
    ;

ConditionalExpressionNoIn
    : LogicalORExpressionNoIn
    | LogicalORExpressionNoIn ? AssignmentExpression : AssignmentExpressionNoIn
        {
        }
    ;

ConditionalExpressionNoBF
    : LogicalORExpressionNoBF
    | LogicalORExpressionNoBF ? AssignmentExpression : AssignmentExpression
        {
        }
    ;

AssignmentExpression
    : ConditionalExpression
    | left_hand_side_expression = AssignmentExpression
        {
        }
    | left_hand_side_expression AssignmentOperator AssignmentExpression
        {
        }
    ;

AssignmentExpressionNoIn
    : ConditionalExpressionNoIn
    | left_hand_side_expression = AssignmentExpressionNoIn
        {
        }
    | left_hand_side_expression AssignmentOperator AssignmentExpressionNoIn
        {
        }
    ;

AssignmentExpressionNoBF
    : ConditionalExpressionNoBF
    | LeftHandSideExpressionNoBF = AssignmentExpression
        {
        }
    | LeftHandSideExpressionNoBF AssignmentOperator AssignmentExpression
        {
        }
    ;

AssignmentOperator
    : *=
    | /=
    | %=
    | +=
    | -=
    | <<=
    | >>=
    | >>>=
    | &=
    | ^=
    | |=
    ;

Expression
    : AssignmentExpression
    | expression , AssignmentExpression
        {

        }
    ;

ExpressionNoIn
    : AssignmentExpressionNoIn
    | expressionNoIn , AssignmentExpressionNoIn
        {

        }
    ;

ExpressionNoBF
    : AssignmentExpressionNoBF
    | expressionNoBF , AssignmentExpression
        {
        }
    ;

Literal
    : NullLiteral
    | BooleanLiteral
    | NumericLiteral
    | StringLiteral
    | RegularExpressionLiteral
    ;

NullLiteral
    : NULL
        {
        }
    ;

BooleanLiteral
    : TRUE
        {
        }
    | FALSE
        {
        }
    ;

NumericLiteral
    : NUMERIC_LITERAL
        {
        }
    ;

StringLiteral
    : STRING_LITERAL
        {
        }
    ;

RegularExpressionLiteral
    : RegularExpressionLiteralBegin REGEXP_LITERAL
        {
        }
    ;

RegularExpressionLiteralBegin
    : /
        {
        }
    | /=
        {
        }
    ;

ReservedWord
    : BREAK
    | CASE
    | CATCH
    | CONTINUE
    | DEBUGGER
    | DEFAULT
    | DELETE
    | DO
    | ELSE
    | FINALLY
    | FOR
    | FUNCTION
    | IF
    | IN
    | INSTANCEOF
    | NEW
    | RETURN
    | SWITCH
    | THIS
    | THROW
    | TRY
    | TYPEOF
    | VAR
    | VOID
    | WHILE
    | WITH
    | TRUE
    | FALSE
    | NULL
    | CLASS
    | CONST
    | ENUM
    | EXPORT
    | EXTENDS
    | IMPORT
    | SUPER
    ;