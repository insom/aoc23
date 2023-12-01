#include <bits/stdc++.h>

#include <fstream>
#include <iostream>
#include <vector>

using namespace std;

class Numero {
 public:
  int value;
  std::string name;
  std::string numeral;

  Numero(int value, string name, string numeral) {
    this->value = value;
    this->name = name;
    this->numeral = numeral;
  }
};

int main() {
  std::ifstream ifs("input1");
  std::string line;
  int runningTotal = 0;

  std::vector<Numero> numbers{
      {0, "zero", "0"},  {1, "one", "1"},  {2, "two", "2"}, {3, "three", "3"},
      {4, "four", "4"},  {5, "five", "5"}, {6, "six", "6"}, {7, "seven", "7"},
      {8, "eight", "8"}, {9, "nine", "9"}};

  while (ifs.good()) {
    getline(ifs, line);
    int firstNumber = -1;
    int lastNumber = -1;

    std::map<int, Numero> matches;

    for (auto n : numbers) {
      size_t r;
      // Forwards
      r = line.find(n.name);
      if (r != string::npos) {
        matches.insert_or_assign(r, n);
      }
      r = line.find(n.numeral);
      if (r != string::npos) {
        matches.insert_or_assign(r, n);
      }
      // Then backwards
      r = line.rfind(n.name);
      if (r != string::npos) {
        matches.insert_or_assign(r, n);
      }
      r = line.rfind(n.numeral);
      if (r != string::npos) {
        matches.insert_or_assign(r, n);
      }
    }
    for (auto x : matches) {
      // Implicitly sorted by key (i.e. position)
      if (firstNumber == -1) {
        firstNumber = x.second.value;
      }
      lastNumber = x.second.value;
    }

    if (firstNumber != -1) {
      runningTotal += (firstNumber * 10) + lastNumber;
    }
  }
  cout << runningTotal << endl;
}
