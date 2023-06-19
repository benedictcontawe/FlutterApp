class StringUtil {

  static bool isBlank(value) {
    if (['', null, 0, false].contains(value)) {
      return true;
    } else {
      return false;
    }
  }
}