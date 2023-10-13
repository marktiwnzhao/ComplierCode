# 寄存器从x0-x31
# name是别名
# t0-t6是临时变量
# zero寄存器的值始终为 0
# 所有运算在寄存器中，不能寄存器和内存值进行运算

# add.asm
li t0, 20	# li: load immediate
# li是一条伪指令，伪指令相当于汇编中的语法糖，由一条或多条基本指令实现
li t1, 20
add t2, t0, t1