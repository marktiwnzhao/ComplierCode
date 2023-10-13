# proc-max.asm

.data
max_result: .word 0

.text
.global main

max:
# a0 (argument 0), a1
blt a0, a1, smaller
j end_max

smaller:
mv a0, a1
end_max:
# jalr zero, 0(ra) 	# jalr: jump and link register，返回地址放在zero里，相当于扔掉
# jr ra 	 		# jr: jump register
ret

########## main ###########
.data
a: .word 100
b: .word 200
.text
main:
lw a0, a	
lw a1, b
# jal ra, max	# jump and link
# jal max
call max
sw a0, max_result, t0
