all:main.cpp
	g++ main.cpp -o hello.out `pkg-config --cflags --libs opencv4`
clean:
	rm hello.out

