import 'prng.dart';
import 'dart:core';

bool isLegacy = false;

class Generator {
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
      "CFGHJKMNPRTVWXYZ0123456789abcdefghjkmnopqrstuvwxyz_<>+=)/,.;:";

  String legacyChar =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz-_<>+*?=()/&%\$!,.;:";

  String randomChar(int start) {
    int idx;
    if (start.compareTo(0) != 0)
      myStartRand(start.toSigned(32));

    isLegacy
        ? idx = myRand() % legacyChar.length
        : idx = myRand() % validChar.length;

    return (isLegacy
        ? legacyChar.substring(idx, idx + 1)
        : validChar.substring(idx, idx + 1));
  }

  int namecount(String name) {
    int ret = 0;
    for (int i = 0; i < name.length; i++) {
      ret += name.codeUnitAt(i);
      isLegacy ? ret *= legacyChar.length : ret *= validChar.length;
      ret = ret.toSigned(32);
    }

    return (ret.toSigned(32));
  }
}
