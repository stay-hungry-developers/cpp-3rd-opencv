all:main.cpp
	g++ main.cpp -o hello.out `pkg-config --cflags --libs opencv`
clean:
	rm hello.out

