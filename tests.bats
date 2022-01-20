#!/usr/bin/env bats

numLines=5
testCasePoints=10

setup()
{
	PATH=$(pwd):$PATH
}

teardown()
{
	rm -f testOutput.txt
}

diff_files()
{
	diff -b -B -Z -y -w -i --strip-trailing-cr $1 $2 
}

@test "compiletest" {
	make all
	run which exe
	[ "$status" -eq 0 ]
}

@test "test1" {
	exe < tests/input1.txt > testOutput.txt
	run diff_files testOutput.txt tests/output1.txt

	if [ $status -ne 0 ]
	then
		for line in $output
		do
			echo $line
		done
		score=$(bc -l <<<"scale=3;(($numLines - $status) / $numLines) * $testCasePoints") 
		echo -e "\x1F$score"
	fi

	[ "$status" -eq 0 ]
}

@test "test2" {
	exe < tests/input2.txt > testOutput.txt
	run diff_files testOutput.txt tests/output2.txt

	if [ $status -ne 0 ]
	then
		for line in $output
		do
			echo $line
		done
		score=$(bc -l <<< "scale=3;(($numLines - $status) / $numLines) * $testCasePoints") 
		echo -e "\x1F$score"
	fi

	[ "$status" -eq 0 ]
}

@test "test3" {
	exe < tests/input3.txt > testOutput.txt
	run diff_files testOutput.txt tests/output3.txt

	if [ $status -ne 0 ]
	then
		for line in $output
		do
			echo $line
		done
		score=$(bc -l <<< "scale=3;(($numLines - $status) / $numLines) * $testCasePoints") 
		echo -e "\x1F$score"
	fi

	[ "$status" -eq 0 ]
}

@test "testclean" {
	make clean
	run which exe
	[ "$status" -ne 0 ]
}
