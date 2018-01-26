#!/bin/bash
a=1
while [ $a -lt 4 ] #here 4 is the the number of lines in input.txt
do
	sed -n $a/p input.txt>inter.txt
	b= `sed -n $a\p input.txt`
	echo "Input: $b"
	./a.out<inter.txt>output.txt
	c=`sed "${a}q;d" ex_op.txt | wc -c`
	d=`sed -n 1p output.txt | wc -c`
	if [ $c -eq $d ]
	then
		echo "PASS"
	else
		echo "FAIL"
	fi
	a= `expr $a + 1`
done
