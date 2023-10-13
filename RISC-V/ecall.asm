li t0, 0
li t1, 10
add t2, t0, t1

li t3, 30
li t4, 40
add t5, t3, t4

sub t6, t2, t5
# SysCall
li a7, 1		# service 1 is print integer
mv a0, t6	# αָ�add a0, t0, zero	#load desired value into argument register a0, using pseudo-op
ecall

