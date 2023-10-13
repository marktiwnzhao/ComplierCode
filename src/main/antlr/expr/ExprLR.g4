// a left-recursive version
grammar ExprLR;

@header {
package expr;
}

prog : expr EOF ;

// 左递归（左结合）文法，使得乘法的优先级高
// (((t-t)-t)-t)

//expr : term ('-' term)* ;
expr : expr '-' term
     | term
     ;

// term: factor ('*' factor)* ;
term : term '*' factor
     | factor
     ;

factor : DIGIT ;

DIGIT : [0-9] ;
WS : [ \t\n\r]+ -> skip ;