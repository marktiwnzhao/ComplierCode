// a right-recursive version
grammar ExprRR;

@header {
package parserantlr.expr;
}

prog : expr EOF ;

// 右递归（右结合）文法，使得乘法的优先级高
// t(-t)(-t)
//右递归的副作用：使得减法和乘法变成右结合

// term - term - term ...
expr : term expr_prime ;
expr_prime : '-' term expr_prime
     |
     ;

// factor * factor * factor ...
term : factor term_prime ;
term_prime : '*' factor term_prime
     |
     ;

factor : DIGIT ;

DIGIT : [0-9] ;
WS : [ \t\n\r]+ -> skip ;