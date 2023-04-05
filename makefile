all:main.cpp
	g++ main.cpp -o hello.out -I/usr/include/opencv4 -L/usr/lib -ljpeg `pkg-config --libs --cflags opencv4`
clean:
	rm hello.out

