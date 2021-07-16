String generatePassword(String name, String code) {
  randomChar(namecount(name) + namecount("tiksat") + namecount(code));

  var newpwd = <int>[];

  bool l, u, d, o;
  do {
    newpwd.length = 0;
    l = u = d = o = false;
    for (int i = 0; i < 6; i++) {
//      newpwd[i] = randomChar(0);
      newpwd.add(randomChar(0));
      if (newpwd[i] >= 97 && newpwd[i] <= 122) // islower?
        l = true;
      else if (newpwd[i] >= 65 && newpwd[i] <= 90) // isupper?
        u = true;
      else if (newpwd[i] >= 48 && newpwd[i] <= 57) // isdigit?
        d = true;
      else
        o = true;
    }
//    newpwd[6] = randomChar(0);
    newpwd.add(randomChar(0));
//    newpwd[7] = randomChar(0);
    newpwd.add(randomChar(0));
  } while (!l || !u || !d || !o);
  return newpwd.toString();
}

String validChar =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz-_<>+*?=()/&%\$!,.;:";

int randomChar(int start) {
  if (start.compareTo(0) != 0) myStartRand(start);
//		myStartRand(start & 0xffffffff);
//	return(validChar[myRand()%len(validChar)]);
  return (validChar.codeUnitAt(myRand() % validChar.length));
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

var r = List<int>.filled(1000, 0);
int init = 0;
int i = 0;

void myStartRand(int seed) {
  r[0] = seed;
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
