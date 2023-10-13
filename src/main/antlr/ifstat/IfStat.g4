grammar IfStat;

@header {
package ifstat;
}

prog : stat EOF ;
// 以下语句在解释if a then if b then c else d中会产生二义性
// 但在antlr4中，由于写在前面的语句优先匹配，所以这个问题实际上被解决了
//stat : 'if' expr 'then' stat
//     | 'if' expr 'then' stat 'else' stat
//     | expr
//     ;

// The following stat rule using '?' also works as expected.
stat : 'if' expr 'then' stat ('else' stat)?
     | expr
     ;

expr : ID ;

ID : [a-z] ;
WS : [ \t\n\r]+ -> skip ;