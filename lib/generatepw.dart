//import 'dart:core';
//import 'package:strings/strings.dart';

//import 'package:quiver/strings.dart';

//import 'package:stripe_api/stripe_api.dart';
//import 'package:stripe_api/text_utils.dart';

String generatePassword(String name, String code) {
  randomChar(namecount(name) + namecount("tiksat") + namecount(code));

  String ret = "";
  String rc;

  bool l, u, d, o;
  do {
    l = u = d = o = false;

    ret = "";
    for (int i = 0; i < 6; i++) {
      rc = randomChar(0);

      ret += rc;
      if (rc.codeUnitAt(0) >= "a".codeUnitAt(0) &&
          rc.codeUnitAt(0) <= "z".codeUnitAt(0)) // islower?
        l = true;
      else if (rc.codeUnitAt(0) >= "A".codeUnitAt(0) &&
          rc.codeUnitAt(0) <= "Z".codeUnitAt(0)) // isupper?
        u = true;
      else if (rc.codeUnitAt(0) >= "0".codeUnitAt(0) &&
          rc.codeUnitAt(0) <= "9".codeUnitAt(0)) // isdigit?
        d = true;
      else
        o = true;
    }
    ret += randomChar(0);
    ret += randomChar(0);
  } while (!l || !u || !d || !o);
  return ret;
}

String validChar =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz-_<>+*?=()/&%\$!,.;:";

String randomChar(int start) {
  int idx;
  if (start.compareTo(0) != 0) myStartRand(start);
//		myStartRand(start & 0xffffffff);
//	return(validChar[myRand()%len(validChar)]);
  idx = myRand() % validChar.length;
  return (validChar.substring(idx, idx + 1));
}

int namecount(String name) {
  int ret = 0;
  for (int i = 0; i < name.length; i++) {
    ret += name.codeUnitAt(i);
    ret *= validChar.length;
  }
  return (ret);
}

const int MAX = 1000;
const int SEED = 12345;
//var r = <int>[MAX]; //fill

var r = List<int>.filled(10000, 0);
int init = 0;
int i = 0;

void myStartRand(int seed) {
  r[0] = seed;
  init = 0;
  //r.length = MAX;
}

int myRand() {
  if (init == 0) {
    init = 1;
    for (i = 1; i < 31; i++) {
//      r[i] = (16807LL * r[i-1]) % 2147483647;
      r[i] = (16807 * r[i - 1]) % 2147483647;
      //r.add((16807 * r[i - 1]) % 2147483647);
      if (r[i] < 0) {
        r[i] += 2147483647;
      }
    }
    for (i = 31; i < 34; i++) {
      r[i] = r[i - 31];
//      r.add(r[i - 31]);
    }
    for (i = 34; i < 344; i++) {
      r[i] = r[i - 31] + r[i - 3];
//      r.add(r[i - 31] + r[i - 3]);
    }
  }
  if (i < MAX)
    r[i] = r[i - 31] + r[i - 3];
//  r.add(r[i - 31] + r[i - 3]);
  else {
    print("\nRandom Overflow!");
    //exit(1);
  }
  return (r[i++] >> 1);
}
