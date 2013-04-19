
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
    | variable_declaration_list_no_in COMMA variable_declaration_no_in
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
    : expression_no_bf SEMI
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
    | FOR LPAREN VAR variable_declaration_list_no_in SEMI expression SEMI RPAREN statement
        {
        }
    | FOR LPAREN VAR variable_declaration_list_no_in SEMI SEMI expression RPAREN statement
        {
        }
    | FOR LPAREN VAR variable_declaration_list_no_in SEMI SEMI RPAREN statement
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
    : LBRACE case_clases RBRACE
        {
        }
    | LBRACE case_clases default_clause case_clases RBRACE
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
    : THROW expression SEMI
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
    : DEBUGGER SEMI
        {
        }
    | DEBUGGER error
        {
        }
    ;

function_declaration
    : FUNCTION IDENTIFIER LPAREN RPAREN LBRACE function_body RBRACE
        {
        }
    | FUNCTION IDENTIFIER LPAREN formal_parameter_list RPAREN LBRACE function_body RBRACE
        {
        }
    ;

function_expression
    : FUNCTION IDENTIFIER LPAREN RPAREN LBRACE function_body RBRACE
        {
        }
    | FUNCTION IDENTIFIER LPAREN formal_parameter_list RPAREN LBRACE function_body RBRACE
        {
        }
    | FUNCTION LPAREN RPAREN LBRACE function_body RBRACE
        {
        }
    | FUNCTION LPAREN formal_parameter_list RPAREN LBRACE function_body RBRACE
        {
        }
    ;

formal_parameter_list
    : IDENTIFIER
        {
        }
    | formal_parameter_list COMMA IDENTIFIER
        {
        }
    ;

function_body
    : source_elements
    ;

program
    : source_elements EOF
        {
        }
    ;

source_elements
    : source_elements source_element
        {
        }
    |
        {
        }
    ;

source_element
    : statement
    | function_declaration
    ;

primary_expression
    : primary_expression_no_brace
    | object_literal
    ;

primary_expression_no_brace
    : THIS
        {
        }
    | IDENTIFIER
        {
        }
    | literal
    | array_literal
    | LPAREN expression RPAREN
        {
        }
    ;

array_literal
    : LBRACK RBRACK
        {
        }
    | LBRACK elision RBRACK
        {
        }
    | LBRACK ElementList RBRACK
        {
        }
    | LBRACK ElementList COMMA RBRACK
        {
        }
    | LBRACK ElementList COMMA elision RBRACK
        {
        }
    ;

ElementList
    : assignment_expression
        {
        }
    | elision assignment_expression
        {
        }
    | ElementList COMMA assignment_expression
        {
        }
    | ElementList COMMA elision assignment_expression
        {
        }
    ;

elision
    : COMMA
        {
        }
    | elision COMMA
        {
        }
    ;

object_literal
    : LBRACE RBRACE
        {
        }
    | LBRACE property_name_and_value_list RBRACE
        {
        }
    | LBRACE property_name_and_value_list COMMA RBRACE
        {
        }
    ;

property_name_and_value_list
    : property_assignment
        {
        }
    | property_name_and_value_list COMMA property_assignment
        {
        }
    ;

property_assignment
    : property_name COLON assignment_expression
        {
        }
    | IDENTIFIER property_name LPAREN RPAREN LBRACE function_body RBRACE
        {
        }
    | IDENTIFIER property_name LPAREN property_set_parameter_list RPAREN LBRACE function_body RBRACE
        {
        }
    ;

property_name
    : identifier_name
    | string_literal
    | numeric_literal
    ;

property_set_parameter_list
    : IDENTIFIER
        {
        }
    ;

member_expression
    : primary_expression
    | function_expression
    | member_expression LBRACK expression RBRACK
        {
        }
    | member_expression DOT identifier_name
        {
        }
    | NEW member_expression arguments
        {
        }
    ;

member_expression_no_bf
    : primary_expression_no_brace
    | member_expression_no_bf LBRACK expression RBRACK
        {
        }
    | member_expression_no_bf DOT identifier_name
        {
        }
    | NEW member_expression arguments
        {
        }
    ;

new_expression
    : member_expression
    | NEW new_expression
        {
        }
    ;

new_expression_no_bf
    : member_expression_no_bf
    | NEW new_expression
        {
        }
    ;

call_expression
    : member_expression arguments
        {
        }
    | call_expression arguments
        {
        }
    | call_expression LBRACK expression RBRACK
        {
        }
    | call_expression DOT identifier_name
        {
        }
    ;

call_expression_no_bf
    : member_expression_no_bf arguments
        {
        }
    | call_expression_no_bf arguments
        {
        }
    | call_expression_no_bf LBRACK expression RBRACK
        {
        }
    | call_expression_no_bf DOT identifier_name
        {
        }
    ;

identifier_name
    : IDENTIFIER
        {
        }
    | reserved_word
        {
        }
    ;

arguments
    : LPAREN RPAREN
        {
        }
    | LPAREN argument_list RPAREN
        {
        }
    ;

argument_list
    : assignment_expression
        {
        }
    | argument_list COMMA assignment_expression
        {
        }
    ;

left_hand_side_expression
    : new_expression
    | CallExpression
    ;

LeftHandSideExpressionNoBF
    : new_expression_no_bf
    | call_expression_no_bf
    ;

PostfixExpression
    : left_hand_side_expression
    | left_hand_side_expression PLUS2
        {
        }
    | left_hand_side_expression MINUS2
        {
        }
    ;

postfix_expression_no_bf
    : LeftHandSideExpressionNoBF
    | LeftHandSideExpressionNoBF PLUS2
        {
        }
    | LeftHandSideExpressionNoBF MINUS2
        {
        }
    ;

UnaryExpression
    : PostfixExpression
    | UnaryExpr
    ;

unary_expression_no_bf
    : postfix_expression_no_bf
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

multiplicative_expression_no_bf
    : unary_expression_no_bf
    | multiplicative_expression_no_bf * UnaryExpression
        {
        }
    | multiplicative_expression_no_bf / UnaryExpression
        {
        }
    | multiplicative_expression_no_bf % UnaryExpression
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
    : multiplicative_expression_no_bf
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

bitwise_xor_expression_no_in
    : BitwiseANDExpressionNoIn
    | bitwise_xor_expression_no_in ^ BitwiseANDExpressionNoIn
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
    | BitwiseORExpression PIPE BitwiseXORExpression
        {
        }
    ;

bitwise_or_expression_no_in
    : bitwise_xor_expression_no_in
    | bitwise_or_expression_no_in PIPE bitwise_xor_expression_no_in
        {
        }
    ;

BitwiseORExpressionNoBF
    : BitwiseXORExpressionNoBF
    | BitwiseORExpressionNoBF PIPE BitwiseXORExpression
        {
        }
    ;

LogicalANDExpression
    : BitwiseORExpression
    | LogicalANDExpression AMPER2 BitwiseORExpression
        {
        }
    ;

LogicalANDExpressionNoIn
    : bitwise_or_expression_no_in
    | LogicalANDExpressionNoIn AMPER2 bitwise_or_expression_no_in
        {
        }
    ;

LogicalANDExpressionNoBF
    : BitwiseORExpressionNoBF
    | LogicalANDExpressionNoBF AMPER2 BitwiseORExpression
        {
        }
    ;

LogicalORExpression
    : LogicalANDExpression
    | LogicalORExpression PIPE2 LogicalANDExpression
        {
        }
    ;

logical_or_expression_no_in
    : LogicalANDExpressionNoIn
    | logical_or_expression_no_in PIPE2 LogicalANDExpressionNoIn
        {
        }
    ;

LogicalORExpressionNoBF
    : LogicalANDExpressionNoBF
    | LogicalORExpressionNoBF PIPE2 LogicalANDExpression
        {
        }
    ;

ConditionalExpression
    : LogicalORExpression
    | LogicalORExpression ? assignment_expression : assignment_expression
        {
        }
    ;

ConditionalExpressionNoIn
    : logical_or_expression_no_in
    | logical_or_expression_no_in ? assignment_expression : assignment_expression_no_in
        {
        }
    ;

conditional_expression_no_bf
    : LogicalORExpressionNoBF
    | LogicalORExpressionNoBF ? assignment_expression : assignment_expression
        {
        }
    ;

assignment_expression
    : ConditionalExpression
    | left_hand_side_expression = assignment_expression
        {
        }
    | left_hand_side_expression AssignmentOperator assignment_expression
        {
        }
    ;

assignment_expression_no_in
    : ConditionalExpressionNoIn
    | left_hand_side_expression = assignment_expression_no_in
        {
        }
    | left_hand_side_expression AssignmentOperator assignment_expression_no_in
        {
        }
    ;

assignment_expression_no_bf
    : conditional_expression_no_bf
    | LeftHandSideExpressionNoBF = assignment_expression
        {
        }
    | LeftHandSideExpressionNoBF AssignmentOperator assignment_expression
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
    : assignment_expression
    | expression COMMA assignment_expression
        {

        }
    ;

ExpressionNoIn
    : assignment_expression_no_in
    | expressionNoIn COMMA assignment_expression_no_in
        {

        }
    ;

ExpressionNoBF
    : assignment_expression_no_bf
    | expressionNoBF COMMA assignment_expression
        {
        }
    ;

literal
    : null_literal
    | boolean_literal
    | numeric_literal
    | string_literal
    | regular_expression_literal
    ;

null_literal
    : NUL
        {
        }
    ;

boolean_literal
    : TRU
        {
        }
    | FALS
        {
        }
    ;

numeric_literal
    : NUMERIC_LITERAL
        {
        }
    ;

string_literal
    : STRING_LITERAL
        {
        }
    ;

regular_expression_literal
    : regular_expression_literal_begin REGEXP_LITERAL
        {
        }
    ;

regular_expression_literal_begin
    : /
        {
        }
    | /=
        {
        }
    ;

reserved_word
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
    | TRU
    | FALS
    | NUL
    | CLASS
    | CONST
    | ENUM
    | EXPORT
    | EXTENDS
    | IMPORT
    | SUPER
    ;