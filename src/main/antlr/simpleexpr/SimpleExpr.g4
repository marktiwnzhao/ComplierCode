grammar SimpleExpr;

import SimpleExprLexerRules;

//生成的.java文件放在这个包里
@header {
package simpleexpr;
}
//EOF：文件结束符
prog : stat* EOF ;

stat : expr ';'
     | ID '=' expr ';'
     | 'if' expr ';'
     ;

//这表明*和/的优先级高于+和-，而不是expr ('+' | '-' | '*' | '/') expr
//语句层层展开，最终是一个个词法单元，其中有ID和INT之类的符号化的词法单元，每个中包含多个成员；另一种如=、(、)、if是字面量形式的词法单元，他们每个自成一类
//antlr默认:字面量的优先级更高。所以if不会被识别为ID
expr : expr ('*' | '/') expr
     | expr ('+' | '-') expr
     | '(' expr ')'
     | ID
     | INT
     | FLOAT
     ;

////以下放到词法分析器的g4文件中
////描述文法的时候小写字母开头，描述词法单元大写开头
////给这些词法起名字，使得在tokens文件中不是编号
//SEMI : ';' ;
//ASSIGN : '=' ;
//IF : 'if' ;//这条规则不能放在ID后
//MUL : '*' ;
//DIV : '/' ;
//ADD : '+' ;
//SUB : '-' ;
//LPAREN : '(' ;
//RPAREN : ')' ;
//
////.匹配任意字符
////+表示一个或多个，?表示1个或0个，*表示0个或多个
////ID : [a-zA-Z_][a-zA-Z0-9_]*
////INT : '0' | [1-9][0-9]*
//ID : (LETTER | '_') WORD* ;
//INT : '0' | ([1-9] DIGIT*) ;
////antlr:以最长匹配优先
////3.12会与FLOAT第一个分支匹配，而不是匹配INT和FLOAT的第二个分支，即使INT规则在前
//FLOAT : INT '.' DIGIT*
//      | '.' DIGIT+
//      ;
//
//WS : [ \t\r\n]+ -> skip ;
//
////SL_COMMENT : '//' .*? '\n' -> skip ;非贪婪匹配：所有匹配的字符串的中取最短的
////~[\n]:除\n以外的
////antlr:匹配规则在前的优先级更高
////DOC注释放在ML前，表明DOC优先级高，从而DOC不会被匹配为ML。特例写在前面
//SL_COMMENT2 : '//' ~[\n]* '\n' -> skip ;
//DOC_COMMENT : '/**' .*? '*/' -> skip ;
//ML_COMMENT : '/*' .*? '*/' -> skip ;
//
////fragment作为辅助的一些规则
//fragment LETTER : [a-zA-Z] ;
//fragment DIGIT : [0-9] ;
//fragment WORD : LETTER | DIGIT | '_' ;
