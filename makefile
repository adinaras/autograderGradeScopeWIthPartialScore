all: exe

exe:
	g++ project_test.cpp -o exe

clean:
	rm -f exe