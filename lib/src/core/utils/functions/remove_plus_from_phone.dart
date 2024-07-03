String removePlusFromDailCode(String? dialCode) {
  if (dialCode != null) {
    List<String> listString = dialCode.split('+');

    return listString[1];
  }

  return '';
}
