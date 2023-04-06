all:main.cpp
	g++ main.cpp -o hello.out -I/usr/include/opencv4 -L/usr/lib/x86_64-linux-gnu/ -ljpeg 
clean:
	rm hello.out

