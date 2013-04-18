
Statement
    : Block
    | VariableStatement
    | EmptyStatement
    | ExpressionStatement
    | IfStatement
    | IterationStatement
    | ContinueStatement
    | BreakStatement
    | ReturnStatement
    | WithStatement
    | LabelledStatement
    | SwitchStatement
    | ThrowStatement
    | TryStatement
    | DebuggerStatement
    ;

Block
    : "{" StatementList "}"
        {
        }
    ;

StatementList
    : StatementList Statement
        {
        }
    |
        {
        }
    ;

VariableStatement
    : "VAR" VariableDeclarationList
        {
        }
    ;

VariableDeclarationList
    : VariableDeclaration
        {
        }
    | VariableDeclarationList "," VariableDeclaration
        {
        }
    ;

VariableDeclarationListNoIn
    : VariableDeclarationNoIn
        {
        }
    | VariableDeclarationListNoIn "," VariableDeclarationNoIn
        {
        }
    ;

VariableDeclaration
    : "IDENTIFIER"
        {
        }
    | "IDENTIFIER" Initialiser
        {
        }
    ;

VariableDeclarationNoIn
    : "IDENTIFIER"
        {
        }
    | "IDENTIFIER" InitialiserNoIn
        {
        }
    ;

Initialiser
    : "=" AssignmentExpression
        {
        }
    ;

InitialiserNoIn
    : "=" AssignmentExpressionNoIn
        {
        }
    ;

EmptyStatement
    : ";"
        {
        }
    ;

ExpressionStatement
    : ExpressionNoBF ";"
        {
        }
    | ExpressionNoBF error
        {
        }
    ;

IfStatement
    : "IF" "(" Expression ")" Statement
        {
        }
    | "IF" "(" Expression ")" Statement "ELSE" Statement
        {
        }
    ;

IterationStatement
    : "DO" Statement "WHILE" "(" Expression ")" ";"
        {
        }
    | "DO" Statement "WHILE" "(" Expression ")" error
        {
        }
    | "WHILE" "(" Expression ")" Statement
        {
        }
    | "FOR" "(" ExpressionNoIn ";" Expression ";" Expression ")" Statement
        {
        }
    | "FOR" "(" ExpressionNoIn ";" Expression ";" ")" Statement
        {
        }
    | "FOR" "(" ExpressionNoIn ";" ";" Expression ")" Statement
        {
        }
    | "FOR" "(" ExpressionNoIn ";" ";" ")" Statement
        {
        }
    | "FOR" "(" ";" Expression ";" Expression ")" Statement
        {
        }
    | "FOR" "(" ";" Expression ";" ")" Statement
        {
        }
    | "FOR" "(" ";" ";" Expression ")" Statement
        {
        }
    | "FOR" "(" ";" ";" ")" Statement
        {
        }
    | "FOR" "(" "VAR" VariableDeclarationListNoIn ";" Expression ";" Expression ")" Statement
        {
        }
    | "FOR" "(" "VAR" VariableDeclarationListNoIn ";" Expression ";" ")" Statement
        {
        }
    | "FOR" "(" "VAR" VariableDeclarationListNoIn ";" ";" Expression ")" Statement
        {
        }
    | "FOR" "(" "VAR" VariableDeclarationListNoIn ";" ";" ")" Statement
        {
        }
    | "FOR" "(" LeftHandSideExpression "IN" Expression ")" Statement
        {
        }
    | "FOR" "(" "VAR" VariableDeclarationNoIn "IN" Expression ")" Statement
        {
        }
    ;

ContinueStatement
    : "CONTINUE" ";"
        {
        }
    | "CONTINUE" error
        {
        }
    | "CONTINUE" "IDENTIFIER" ";"
        {
        }
    | "CONTINUE" "IDENTIFIER" error
        {
        }
    ;

BreakStatement
    : "BREAK" ";"
        {
        }
    | "BREAK" error
        {
        }
    | "BREAK" "IDENTIFIER" ";"
        {
        }
    | "BREAK" "IDENTIFIER" error
        {
        }
    ;

ReturnStatement
    : "RETURN" ";"
        {
        }
    | "RETURN" error
        {
        }
    | "RETURN" Expression ";"
        {
        }
    | "RETURN" Expression error
        {
        }
    ;

WithStatement
    : "WITH" "(" Expression ")" Statement
        {
        }
    ;

SwitchStatement
    : "SWITCH" "(" Expression ")" CaseBlock
        {
        }
    ;

CaseBlock
    : "{" CaseClauses "}"
        {
        }
    | "{" CaseClauses DefaultClause CaseClauses "}"
        {
        }
    ;

CaseClauses
    : CaseClauses CaseClause
        {
        }
    |
        {
        }
    ;

CaseClause
    : "CASE" Expression ":" StatementList
        {
        }
    ;

DefaultClause
    : "DEFAULT" ":" StatementList
        {
        }
    ;

LabelledStatement
    : "IDENTIFIER" ":" Statement
        {
        }
    ;

ThrowStatement
    : "THROW" Expression ";"
        {
        }
    | "THROW" Expression error
        {
        }
    ;

TryStatement
    : "TRY" Block Catch
        {
        }
    | "TRY" Block Finally
        {
        }
    | "TRY" Block Catch Finally
        {
        }
    ;

Catch
    : "CATCH" "(" "IDENTIFIER" ")" Block
        {
        }
    ;

Finally
    : "FINALLY" Block
        {
        }
    ;

DebuggerStatement
    : "DEBUGGER" ";"
        {
        }
    | "DEBUGGER" error
        {
        }
    ;

FunctionDeclaration
    : "FUNCTION" "IDENTIFIER" "(" ")" "{" FunctionBody "}"
        {
        }
    | "FUNCTION" "IDENTIFIER" "(" FormalParameterList ")" "{" FunctionBody "}"
        {
        }
    ;

FunctionExpression
    : "FUNCTION" "IDENTIFIER" "(" ")" "{" FunctionBody "}"
        {
        }
    | "FUNCTION" "IDENTIFIER" "(" FormalParameterList ")" "{" FunctionBody "}"
        {
        }
    | "FUNCTION" "(" ")" "{" FunctionBody "}"
        {
        }
    | "FUNCTION" "(" FormalParameterList ")" "{" FunctionBody "}"
        {
        }
    ;

FormalParameterList
    : "IDENTIFIER"
        {
        }
    | FormalParameterList "," "IDENTIFIER"
        {
        }
    ;

FunctionBody
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
    : Statement
    | FunctionDeclaration
    ;

PrimaryExpression
    : PrimaryExpressionNoBrace
    | ObjectLiteral
    ;

PrimaryExpressionNoBrace
    : "THIS"
        {
        }
    | "IDENTIFIER"
        {
        }
    | Literal
    | ArrayLiteral
    | "(" Expression ")"
        {
        }
    ;

ArrayLiteral
    : "[" "]"
        {
        }
    | "[" Elision "]"
        {
        }
    | "[" ElementList "]"
        {
        }
    | "[" ElementList "," "]"
        {
        }
    | "[" ElementList "," Elision "]"
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
    | ElementList "," AssignmentExpression
        {
        }
    | ElementList "," Elision AssignmentExpression
        {
        }
    ;

Elision
    : ","
        {
        }
    | Elision ","
        {
        }
    ;

ObjectLiteral
    : "{" "}"
        {
        }
    | "{" PropertyNameAndValueList "}"
        {
        }
    | "{" PropertyNameAndValueList "," "}"
        {
        }
    ;

PropertyNameAndValueList
    : PropertyAssignment
        {
        }
    | PropertyNameAndValueList "," PropertyAssignment
        {
        }
    ;

PropertyAssignment
    : PropertyName ":" AssignmentExpression
        {
        }
    | "IDENTIFIER" PropertyName "(" ")" "{" FunctionBody "}"
        {
        }
    | "IDENTIFIER" PropertyName "(" PropertySetParameterList ")" "{" FunctionBody "}"
        {
        }
    ;

PropertyName
    : IdentifierName
    | StringLiteral
    | NumericLiteral
    ;

PropertySetParameterList
    : "IDENTIFIER"
        {
        }
    ;

MemberExpression
    : PrimaryExpression
    | FunctionExpression
    | MemberExpression "[" Expression "]"
        {
        }
    | MemberExpression "." IdentifierName
        {
        }
    | "NEW" MemberExpression Arguments
        {
        }
    ;

MemberExpressionNoBF
    : PrimaryExpressionNoBrace
    | MemberExpressionNoBF "[" Expression "]"
        {
        }
    | MemberExpressionNoBF "." IdentifierName
        {
        }
    | "NEW" MemberExpression Arguments
        {
        }
    ;

NewExpression
    : MemberExpression
    | "NEW" NewExpression
        {
        }
    ;

NewExpressionNoBF
    : MemberExpressionNoBF
    | "NEW" NewExpression
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
    | CallExpression "[" Expression "]"
        {
        }
    | CallExpression "." IdentifierName
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
    | CallExpressionNoBF "[" Expression "]"
        {
        }
    | CallExpressionNoBF "." IdentifierName
        {
        }
    ;

IdentifierName
    : "IDENTIFIER"
        {
        }
    | ReservedWord
        {
        }
    ;

Arguments
    : "(" ")"
        {
        }
    | "(" ArgumentList ")"
        {
        }
    ;

ArgumentList
    : AssignmentExpression
        {
        }
    | ArgumentList "," AssignmentExpression
        {
        }
    ;

LeftHandSideExpression
    : NewExpression
    | CallExpression
    ;

LeftHandSideExpressionNoBF
    : NewExpressionNoBF
    | CallExpressionNoBF
    ;

PostfixExpression
    : LeftHandSideExpression
    | LeftHandSideExpression "++"
        {
        }
    | LeftHandSideExpression "--"
        {
        }
    ;

PostfixExpressionNoBF
    : LeftHandSideExpressionNoBF
    | LeftHandSideExpressionNoBF "++"
        {
        }
    | LeftHandSideExpressionNoBF "--"
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
    : "DELETE" UnaryExpression
        {
        }
    | "VOID" UnaryExpression
        {
        }
    | "TYPEOF" UnaryExpression
        {
        }
    | "BR++" UnaryExpression
        {
        }
    | "BR--" UnaryExpression
        {
        }
    | "++" UnaryExpression
        {
        }
    | "--" UnaryExpression
        {
        }
    | "+" UnaryExpression
        {
        }
    | "-" UnaryExpression
        {
        }
    | "~" UnaryExpression
        {
        }
    | "!" UnaryExpression
        {
        }
    ;

MultiplicativeExpression
    : UnaryExpression
    | MultiplicativeExpression "*" UnaryExpression
        {
        }
    | MultiplicativeExpression "/" UnaryExpression
        {
        }
    | MultiplicativeExpression "%" UnaryExpression
        {
        }
    ;

MultiplicativeExpressionNoBF
    : UnaryExpressionNoBF
    | MultiplicativeExpressionNoBF "*" UnaryExpression
        {
        }
    | MultiplicativeExpressionNoBF "/" UnaryExpression
        {
        }
    | MultiplicativeExpressionNoBF "%" UnaryExpression
        {
        }
    ;

AdditiveExpression
    : MultiplicativeExpression
    | AdditiveExpression "+" MultiplicativeExpression
        {
        }
    | AdditiveExpression "-" MultiplicativeExpression
        {
        }
    ;

AdditiveExpressionNoBF
    : MultiplicativeExpressionNoBF
    | AdditiveExpressionNoBF "+" MultiplicativeExpression
        {
        }
    | AdditiveExpressionNoBF "-" MultiplicativeExpression
        {
        }
    ;

ShiftExpression
    : AdditiveExpression
    | ShiftExpression "<<" AdditiveExpression
        {
        }
    | ShiftExpression ">>" AdditiveExpression
        {
        }
    | ShiftExpression ">>>" AdditiveExpression
        {
        }
    ;

ShiftExpressionNoBF
    : AdditiveExpressionNoBF
    | ShiftExpressionNoBF "<<" AdditiveExpression
        {
        }
    | ShiftExpressionNoBF ">>" AdditiveExpression
        {
        }
    | ShiftExpressionNoBF ">>>" AdditiveExpression
        {
        }
    ;

RelationalExpression
    : ShiftExpression
    | RelationalExpression "<" ShiftExpression
        {
        }
    | RelationalExpression ">" ShiftExpression
        {
        }
    | RelationalExpression "<=" ShiftExpression
        {
        }
    | RelationalExpression ">=" ShiftExpression
        {
        }
    | RelationalExpression "INSTANCEOF" ShiftExpression
        {
        }
    | RelationalExpression "IN" ShiftExpression
        {
        }
    ;

RelationalExpressionNoIn
    : ShiftExpression
    | RelationalExpressionNoIn "<" ShiftExpression
        {
        }
    | RelationalExpressionNoIn ">" ShiftExpression
        {
        }
    | RelationalExpressionNoIn "<=" ShiftExpression
        {
        }
    | RelationalExpressionNoIn ">=" ShiftExpression
        {
        }
    | RelationalExpressionNoIn "INSTANCEOF" ShiftExpression
        {
        }
    ;

RelationalExpressionNoBF
    : ShiftExpressionNoBF
    | RelationalExpressionNoBF "<" ShiftExpression
        {
        }
    | RelationalExpressionNoBF ">" ShiftExpression
        {
        }
    | RelationalExpressionNoBF "<=" ShiftExpression
        {
        }
    | RelationalExpressionNoBF ">=" ShiftExpression
        {
        }
    | RelationalExpressionNoBF "INSTANCEOF" ShiftExpression
        {
        }
    | RelationalExpressionNoBF "IN" ShiftExpression
        {
        }
    ;

EqualityExpression
    : RelationalExpression
    | EqualityExpression "==" RelationalExpression
        {
        }
    | EqualityExpression "!=" RelationalExpression
        {
        }
    | EqualityExpression "===" RelationalExpression
        {
        }
    | EqualityExpression "!==" RelationalExpression
        {
        }
    ;

EqualityExpressionNoIn
    : RelationalExpressionNoIn
    | EqualityExpressionNoIn "==" RelationalExpressionNoIn
        {
        }
    | EqualityExpressionNoIn "!=" RelationalExpressionNoIn
        {
        }
    | EqualityExpressionNoIn "===" RelationalExpressionNoIn
        {
        }
    | EqualityExpressionNoIn "!==" RelationalExpressionNoIn
        {
        }
    ;

EqualityExpressionNoBF
    : RelationalExpressionNoBF
    | EqualityExpressionNoBF "==" RelationalExpression
        {
        }
    | EqualityExpressionNoBF "!=" RelationalExpression
        {
        }
    | EqualityExpressionNoBF "===" RelationalExpression
        {
        }
    | EqualityExpressionNoBF "!==" RelationalExpression
        {
        }
    ;

BitwiseANDExpression
    : EqualityExpression
    | BitwiseANDExpression "&" EqualityExpression
        {
        }
    ;

BitwiseANDExpressionNoIn
    : EqualityExpressionNoIn
    | BitwiseANDExpressionNoIn "&" EqualityExpressionNoIn
        {
        }
    ;

BitwiseANDExpressionNoBF
    : EqualityExpressionNoBF
    | BitwiseANDExpressionNoBF "&" EqualityExpression
        {
        }
    ;

BitwiseXORExpression
    : BitwiseANDExpression
    | BitwiseXORExpression "^" BitwiseANDExpression
        {
        }
    ;

BitwiseXORExpressionNoIn
    : BitwiseANDExpressionNoIn
    | BitwiseXORExpressionNoIn "^" BitwiseANDExpressionNoIn
        {
        }
    ;

BitwiseXORExpressionNoBF
    : BitwiseANDExpressionNoBF
    | BitwiseXORExpressionNoBF "^" BitwiseANDExpression
        {
        }
    ;

BitwiseORExpression
    : BitwiseXORExpression
    | BitwiseORExpression "|" BitwiseXORExpression
        {
        }
    ;

BitwiseORExpressionNoIn
    : BitwiseXORExpressionNoIn
    | BitwiseORExpressionNoIn "|" BitwiseXORExpressionNoIn
        {
        }
    ;

BitwiseORExpressionNoBF
    : BitwiseXORExpressionNoBF
    | BitwiseORExpressionNoBF "|" BitwiseXORExpression
        {
        }
    ;

LogicalANDExpression
    : BitwiseORExpression
    | LogicalANDExpression "&&" BitwiseORExpression
        {
        }
    ;

LogicalANDExpressionNoIn
    : BitwiseORExpressionNoIn
    | LogicalANDExpressionNoIn "&&" BitwiseORExpressionNoIn
        {
        }
    ;

LogicalANDExpressionNoBF
    : BitwiseORExpressionNoBF
    | LogicalANDExpressionNoBF "&&" BitwiseORExpression
        {
        }
    ;

LogicalORExpression
    : LogicalANDExpression
    | LogicalORExpression "||" LogicalANDExpression
        {
        }
    ;

LogicalORExpressionNoIn
    : LogicalANDExpressionNoIn
    | LogicalORExpressionNoIn "||" LogicalANDExpressionNoIn
        {
        }
    ;

LogicalORExpressionNoBF
    : LogicalANDExpressionNoBF
    | LogicalORExpressionNoBF "||" LogicalANDExpression
        {
        }
    ;

ConditionalExpression
    : LogicalORExpression
    | LogicalORExpression "?" AssignmentExpression ":" AssignmentExpression
        {
        }
    ;

ConditionalExpressionNoIn
    : LogicalORExpressionNoIn
    | LogicalORExpressionNoIn "?" AssignmentExpression ":" AssignmentExpressionNoIn
        {
        }
    ;

ConditionalExpressionNoBF
    : LogicalORExpressionNoBF
    | LogicalORExpressionNoBF "?" AssignmentExpression ":" AssignmentExpression
        {
        }
    ;

AssignmentExpression
    : ConditionalExpression
    | LeftHandSideExpression "=" AssignmentExpression
        {
        }
    | LeftHandSideExpression AssignmentOperator AssignmentExpression
        {
        }
    ;

AssignmentExpressionNoIn
    : ConditionalExpressionNoIn
    | LeftHandSideExpression "=" AssignmentExpressionNoIn
        {
        }
    | LeftHandSideExpression AssignmentOperator AssignmentExpressionNoIn
        {
        }
    ;

AssignmentExpressionNoBF
    : ConditionalExpressionNoBF
    | LeftHandSideExpressionNoBF "=" AssignmentExpression
        {
        }
    | LeftHandSideExpressionNoBF AssignmentOperator AssignmentExpression
        {
        }
    ;

AssignmentOperator
    : "*="
    | "/="
    | "%="
    | "+="
    | "-="
    | "<<="
    | ">>="
    | ">>>="
    | "&="
    | "^="
    | "|="
    ;

Expression
    : AssignmentExpression
    | Expression "," AssignmentExpression
        {

        }
    ;

ExpressionNoIn
    : AssignmentExpressionNoIn
    | ExpressionNoIn "," AssignmentExpressionNoIn
        {

        }
    ;

ExpressionNoBF
    : AssignmentExpressionNoBF
    | ExpressionNoBF "," AssignmentExpression
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
    : "NULL"
        {
        }
    ;

BooleanLiteral
    : "TRUE"
        {
        }
    | "FALSE"
        {
        }
    ;

NumericLiteral
    : "NUMERIC_LITERAL"
        {
        }
    ;

StringLiteral
    : "STRING_LITERAL"
        {
        }
    ;

RegularExpressionLiteral
    : RegularExpressionLiteralBegin "REGEXP_LITERAL"
        {
        }
    ;

RegularExpressionLiteralBegin
    : "/"
        {
        }
    | "/="
        {
        }
    ;

ReservedWord
    : "BREAK"
    | "CASE"
    | "CATCH"
    | "CONTINUE"
    | "DEBUGGER"
    | "DEFAULT"
    | "DELETE"
    | "DO"
    | "ELSE"
    | "FINALLY"
    | "FOR"
    | "FUNCTION"
    | "IF"
    | "IN"
    | "INSTANCEOF"
    | "NEW"
    | "RETURN"
    | "SWITCH"
    | "THIS"
    | "THROW"
    | "TRY"
    | "TYPEOF"
    | "VAR"
    | "VOID"
    | "WHILE"
    | "WITH"
    | "TRUE"
    | "FALSE"
    | "NULL"
    | "CLASS"
    | "CONST"
    | "ENUM"
    | "EXPORT"
    | "EXTENDS"
    | "IMPORT"
    | "SUPER"
    ;