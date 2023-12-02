#include <bits/stdc++.h>

#include <fstream>
#include <iostream>
#include <vector>

using namespace std;

/* cf. https://stackoverflow.com/a/46931770 --  Arafat Hasan */
vector<string> split(const string &s, char delim) {
  vector<string> result;
  stringstream ss(s);
  string item;

  while (getline(ss, item, delim)) {
    result.push_back(item);
  }

  return result;
}

int main() {
  ifstream ifs("input2");
  string line;
  int running_total = 0;
  map<string, int> targets = {{"red", 12}, {"green", 13}, {"blue", 14}};

  while (ifs.good()) {
    bool valid = true;
    getline(ifs, line);
    if (line.length() == 0) break;
    auto bits = split(line, ':');
    string fore = bits.front();
    auto hands = split(bits.back(), ';');
    for (string hand : hands) {
      auto handfuls = split(hand, ',');
      for (string handful : handfuls) {
        if (handful.at(0) == ' ') {
          handful = handful.substr(1);
        }
        auto bits_two = split(handful, ' ');
        int number = atoi(bits_two.front().c_str());
        string color = bits_two.back();
        if (targets.at(color) < number) {
          valid = false;
        }
      }
    }
    if (valid) {
      int game_number = atoi(split(fore, ' ').back().c_str());
      running_total += game_number;
    }
  }
  cout << running_total << endl;
}
