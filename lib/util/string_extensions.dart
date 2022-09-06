extension ValidationExtension on String {
  bool isStringValid({int minLength = 2, int maxLength = 200}) {
    if (length < minLength) {
      return false;
    } else if (length > maxLength) {
      return false;
    }
    return true;
  }
}
