all: day1 day1-1
day1: day1.cc
	g++ -g day1.cc -o day1
	./day1
day1-1: day1-1.cc
	g++ -g day1-1.cc -o day1-1
	./day1-1
.PHONY: all
