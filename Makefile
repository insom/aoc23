all: day1
day1: day1.cc
	g++ -g day1.cc -o day1
	./day1
.PHONY: all
