
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
    | LBRACK element_list RBRACK
        {
        }
    | LBRACK element_list COMMA RBRACK
        {
        }
    | LBRACK element_list COMMA elision RBRACK
        {
        }
    ;

element_list
    : assignment_expression
        {
        }
    | elision assignment_expression
        {
        }
    | element_list COMMA assignment_expression
        {
        }
    | element_list COMMA elision assignment_expression
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
    | call_expression
    ;

left_hand_side_expression_no_bf
    : new_expression_no_bf
    | call_expression_no_bf
    ;

postfix_expression
    : left_hand_side_expression
    | left_hand_side_expression PLUS2
        {
        }
    | left_hand_side_expression MINUS2
        {
        }
    ;

postfix_expression_no_bf
    : left_hand_side_expression_no_bf
    | left_hand_side_expression_no_bf PLUS2
        {
        }
    | left_hand_side_expression_no_bf MINUS2
        {
        }
    ;

unary_expression
    : postfix_expression
    | unary_expr
    ;

unary_expression_no_bf
    : postfix_expression_no_bf
    | unary_expr
    ;

unary_expr
    : DELETE unary_expression
        {
        }
    | VOID unary_expression
        {
        }
    | TYPEOF unary_expression
        {
        }
    | BR++ unary_expression
        {
        }
    | BR-- unary_expression
        {
        }
    | PLUS2 unary_expression
        {
        }
    | MINUS2 unary_expression
        {
        }
    | PLUS unary_expression
        {
        }
    | MINUS unary_expression
        {
        }
    | TILDE unary_expression
        {
        }
    | EXCLAMATION unary_expression
        {
        }
    ;

multiplicative_expression
    : unary_expression
    | multiplicative_expression TIMES unary_expression
        {
        }
    | multiplicative_expression DIVIDE unary_expression
        {
        }
    | multiplicative_expression PERCENT unary_expression
        {
        }
    ;

multiplicative_expression_no_bf
    : unary_expression_no_bf
    | multiplicative_expression_no_bf TIMES unary_expression
        {
        }
    | multiplicative_expression_no_bf DIVIDE unary_expression
        {
        }
    | multiplicative_expression_no_bf PERCENT unary_expression
        {
        }
    ;

additive_expression
    : multiplicative_expression
    | additive_expression PLUS multiplicative_expression
        {
        }
    | additive_expression MINUS multiplicative_expression
        {
        }
    ;

additive_expression_no_bf
    : multiplicative_expression_no_bf
    | additive_expression_no_bf PLUS multiplicative_expression
        {
        }
    | additive_expression_no_bf MINUS multiplicative_expression
        {
        }
    ;

shift_expression
    : additive_expression
    | shift_expression LSHIFT additive_expression
        {
        }
    | shift_expression RSHIFT additive_expression
        {
        }
    | shift_expression GT3 additive_expression
        {
        }
    ;

shift_expression_no_bf
    : additive_expression_no_bf
    | shift_expression_no_bf LSHIFT additive_expression
        {
        }
    | shift_expression_no_bf RSHIFT additive_expression
        {
        }
    | shift_expression_no_bf GT3 additive_expression
        {
        }
    ;

relational_expression
    : shift_expression
    | relational_expression LT shift_expression
        {
        }
    | relational_expression GT shift_expression
        {
        }
    | relational_expression LTE shift_expression
        {
        }
    | relational_expression GTE shift_expression
        {
        }
    | relational_expression INSTANCEOF shift_expression
        {
        }
    | relational_expression IN shift_expression
        {
        }
    ;

relational_expression_no_in
    : shift_expression
    | relational_expression_no_in LT shift_expression
        {
        }
    | relational_expression_no_in GT shift_expression
        {
        }
    | relational_expression_no_in LTE shift_expression
        {
        }
    | relational_expression_no_in GTE shift_expression
        {
        }
    | relational_expression_no_in INSTANCEOF shift_expression
        {
        }
    ;

relational_expression_no_bf
    : shift_expression_no_bf
    | relational_expression_no_bf LT shift_expression
        {
        }
    | relational_expression_no_bf GT shift_expression
        {
        }
    | relational_expression_no_bf LTE shift_expression
        {
        }
    | relational_expression_no_bf GTE shift_expression
        {
        }
    | relational_expression_no_bf INSTANCEOF shift_expression
        {
        }
    | relational_expression_no_bf IN shift_expression
        {
        }
    ;

equality_expression
    : relational_expression
    | equality_expression EQ2 relational_expression
        {
        }
    | equality_expression NOT_EQ relational_expression
        {
        }
    | equality_expression EQ3 relational_expression
        {
        }
    | equality_expression NOT_EQ2 relational_expression
        {
        }
    ;

equality_expression_no_in
    : relational_expression_no_in
    | equality_expression_no_in EQ2 relational_expression_no_in
        {
        }
    | equality_expression_no_in NOT_EQ relational_expression_no_in
        {
        }
    | equality_expression_no_in EQ3 relational_expression_no_in
        {
        }
    | equality_expression_no_in NOT_EQ2 relational_expression_no_in
        {
        }
    ;

equality_expression_no_bf
    : relational_expression_no_bf
    | equality_expression_no_bf EQ2 relational_expression
        {
        }
    | equality_expression_no_bf NOT_EQ relational_expression
        {
        }
    | equality_expression_no_bf EQ3 relational_expression
        {
        }
    | equality_expression_no_bf NOT_EQ2 relational_expression
        {
        }
    ;

bitwise_and_expression
    : equality_expression
    | bitwise_and_expression AMPER equality_expression
        {
        }
    ;

bitwise_and_expression_no_in
    : equality_expression_no_in
    | bitwise_and_expression_no_in AMPER equality_expression_no_in
        {
        }
    ;

bitwise_and_expression_no_bf
    : equality_expression_no_bf
    | bitwise_and_expression_no_bf AMPER equality_expression
        {
        }
    ;

bitwise_xor_expression
    : bitwise_and_expression
    | bitwise_xor_expression CARET bitwise_and_expression
        {
        }
    ;

bitwise_xor_expression_no_in
    : bitwise_and_expression_no_in
    | bitwise_xor_expression_no_in CARET bitwise_and_expression_no_in
        {
        }
    ;

bitwise_xor_expression_no_bf
    : bitwise_and_expression_no_bf
    | bitwise_xor_expression_no_bf CARET bitwise_and_expression
        {
        }
    ;

bitwise_or_expression
    : bitwise_xor_expression
    | bitwise_or_expression PIPE bitwise_xor_expression
        {
        }
    ;

bitwise_or_expression_no_in
    : bitwise_xor_expression_no_in
    | bitwise_or_expression_no_in PIPE bitwise_xor_expression_no_in
        {
        }
    ;

bitwise_or_expression_no_bf
    : bitwise_xor_expression_no_bf
    | bitwise_or_expression_no_bf PIPE bitwise_xor_expression
        {
        }
    ;

logical_and_expression
    : bitwise_or_expression
    | logical_and_expression AMPER2 bitwise_or_expression
        {
        }
    ;

logical_and_expression_no_in
    : bitwise_or_expression_no_in
    | logical_and_expression_no_in AMPER2 bitwise_or_expression_no_in
        {
        }
    ;

logical_and_expression_no_bf
    : bitwise_or_expression_no_bf
    | logical_and_expression_no_bf AMPER2 bitwise_or_expression
        {
        }
    ;

logical_or_expression
    : logical_and_expression
    | logical_or_expression PIPE2 logical_and_expression
        {
        }
    ;

logical_or_expression_no_in
    : logical_and_expression_no_in
    | logical_or_expression_no_in PIPE2 logical_and_expression_no_in
        {
        }
    ;

logical_or_expression_no_bf
    : logical_and_expression_no_bf
    | logical_or_expression_no_bf PIPE2 logical_and_expression
        {
        }
    ;

conditional_expression
    : logical_or_expression
    | logical_or_expression QUESTION assignment_expression COLON assignment_expression
        {
        }
    ;

conditional_expression_no_in
    : logical_or_expression_no_in
    | logical_or_expression_no_in QUESTION assignment_expression COLON assignment_expression_no_in
        {
        }
    ;

conditional_expression_no_bf
    : logical_or_expression_no_bf
    | logical_or_expression_no_bf QUESTION assignment_expression COLON assignment_expression
        {
        }
    ;

assignment_expression
    : conditional_expression
    | left_hand_side_expression EQ assignment_expression
        {
        }
    | left_hand_side_expression assignment_operator assignment_expression
        {
        }
    ;

assignment_expression_no_in
    : conditional_expression_no_in
    | left_hand_side_expression EQ assignment_expression_no_in
        {
        }
    | left_hand_side_expression assignment_operator assignment_expression_no_in
        {
        }
    ;

assignment_expression_no_bf
    : conditional_expression_no_bf
    | left_hand_side_expression_no_bf EQ assignment_expression
        {
        }
    | left_hand_side_expression_no_bf assignment_operator assignment_expression
        {
        }
    ;

assignment_operator
    : TIMES_EQ
    | DIVIDE_EQ
    | PERCENT_EQ
    | PLUS_EQ
    | MINUS_EQ
    | LSHIFT_EQ
    | RSHIFT_EQ
    | GT3_Eq
    | AMPER_EQ
    | CARET_EQ
    | PIPE_EQ
    ;

Expression
    : assignment_expression
    | expression COMMA assignment_expression
        {

        }
    ;

expression_no_in
    : assignment_expression_no_in
    | expression_no_in COMMA assignment_expression_no_in
        {

        }
    ;

expression_no_bf
    : assignment_expression_no_bf
    | expression_no_bf COMMA assignment_expression
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
    : DIVIDE
        {
        }
    | DIVIDE_EQ
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