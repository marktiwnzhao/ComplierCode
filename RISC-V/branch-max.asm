# c = max(a, b)

.data
a: .word 100
b: .word 200
c: .word 0

.text
lw t0, a		# 此模拟器提供的指令，不属于标准指令
lw t1, b

bge t0, t1, greater_equal
mv t2, t1
j end # j: jump

greater_equal:
mv t2, t0

# la t3, c
# sw t2, 0(t3)
end:
sw t2, c, t3
 

