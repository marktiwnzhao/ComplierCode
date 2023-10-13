grammar Expr;

@header {
package expr;
}

prog : expr EOF ;
// antlr4没有明确指明结合性时，默认左结合，如1-2-3
// antlr4中写在前面的优先级高，所以运算符的优先级带来的二义性被消除，1-2*3
expr :
  | expr '*' expr
  | expr '-' expr
  | DIGIT
  ;

DIGIT : [0-9] ;
WS : [ \t\n\r]+ -> skip ;