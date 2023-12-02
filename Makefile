all: day1 day1-1 day2
day1: day1.cc
	g++ -g day1.cc -o day1
	./day1
day1-1: day1-1.cc
	g++ -g day1-1.cc -o day1-1
	./day1-1
day2: day2.cc
	g++ -g day2.cc -o day2
	./day2
.PHONY: all
