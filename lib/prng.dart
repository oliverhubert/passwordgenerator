import 'dart:core';

//The GLIBC random number generator
//https://www.mscs.dal.ca/~selinger/random/

const int MAX = 10000;
const int SEED = 12345;
const int MAX32_UNSIGNED = 4294967296;
const int MAX32_SIGNED = 2147483648;

var r = List<int>.filled(MAX, 0);
int init = 0;
int i = 0;

void myStartRand(int seed) {
   if (seed > MAX32_SIGNED) {
     r[0] = seed - MAX32_UNSIGNED;
   } else {
  r[0] = seed - (seed ~/ MAX32_UNSIGNED) * MAX32_UNSIGNED;
   }
  init = 0;
}

int myRand() {
  if (init == 0) {
    init = 1;
    for (i = 1; i < 31; i++) {
      r[i] = ((16807 * (r[i - 1])) % 2147483647);
      if (r[i] < 0) {
        r[i] += 2147483647;

        r[i] = r[i] - (r[i] ~/ MAX32_UNSIGNED) * MAX32_UNSIGNED;
      }
    }
    for (i = 31; i < 34; i++) {
      r[i] = r[i - 31];
    }
    for (i = 34; i < 344; i++) {
      r[i] = (r[i - 31] + r[i - 3]);
      r[i] = r[i] - (r[i] ~/ MAX32_UNSIGNED) * MAX32_UNSIGNED;
    }
  }
  if (i < MAX) {
    r[i] = (r[i - 31] + r[i - 3]);
    r[i] = r[i] -(r[i] ~/ MAX32_UNSIGNED) * MAX32_UNSIGNED;
  } else {
    print("\nRandom Overflow!");
  }
  return (r[i++] >> 1);
}
