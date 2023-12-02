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

  while (ifs.good()) {
    map<string, int> targets = {{"red", 0}, {"green", 0}, {"blue", 0}};
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
          targets.insert_or_assign(color, number);
        }
      }
    }
    {
      int power = 1;
      for (auto t : targets) {
        power *= t.second;
      }
      running_total += power;
    }
  }
  cout << running_total << endl;
}
