#include <bits/stdc++.h>

#include <fstream>
#include <iostream>
#include <vector>

using namespace std;

int main() {
  std::ifstream ifs("input1");
  std::string line;
  int runningTotal = 0;

  while (ifs.good()) {
    getline(ifs, line);
    int firstNumber = -1;
    int lastNumber = -1;
    for (char c : line) {
      if(c >= '0' && c <= '9') {
        if(firstNumber == -1) {
          firstNumber = c - '0';
        }
        lastNumber = c - '0';
      }
    }
    if(firstNumber != -1) {
      cout << firstNumber << lastNumber << endl;
      runningTotal += (firstNumber * 10) + lastNumber;
    }
  }
  cout << runningTotal << endl;
}
