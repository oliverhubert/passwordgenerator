import 'dart:ffi';

import 'dart:core';

import 'makepwd.dart';

const int MAX = 10000;
const int SEED = 12345;

var r = List<int>.filled(MAX, 0);
int init = 0;
int i = 0;

void myStartRand(int seed) {
  r[0] = seed & 0x00000000ffffffff;
  init = 0;
}

int myRand() {
  if (init == 0) {
    init = 1;
    for (i = 1; i < 31; i++) {
      r[i] = ((16807 * (r[i - 1])) % 2147483647) & 0x00000000ffffffff;
      if (r[i] < 0) {
        r[i] += 2147483647;
        r[i] &= 0x00000000ffffffff;
      }
    }
    for (i = 31; i < 34; i++) {
      r[i] = r[i - 31];
    }
    for (i = 34; i < 344; i++) {
      r[i] = (r[i - 31] + r[i - 3]) & 0x00000000ffffffff;
    }
  }
  if (i < MAX)
    r[i] = (r[i - 31] + r[i - 3]) & 0x00000000ffffffff;
  else {
    print("\nRandom Overflow!");
    //exit(1);
  }
  return ((r[i++] >> 1) & 0x00000000ffffffff);
}
