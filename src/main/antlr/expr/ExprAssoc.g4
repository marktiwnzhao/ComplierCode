grammar ExprAssoc;
//前缀运算符和后缀运算符只会是右结合和左结合的，没有二义性
//将幂运算设为右结合
expr: '!' expr
    | <assoc = right> expr '^' expr
    | DIGIT
    ;

DIGIT : [0-9] ;
WS : [ \t\n\r]+ -> skip ;