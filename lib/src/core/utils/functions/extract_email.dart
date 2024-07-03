String extractEmail(String userEmail) {
  List<String> splittedEmail = userEmail.split('@');
  var firstPart = splittedEmail[0];
  var secoondPart = splittedEmail[1];

  // add asteris to the first part
  var email = firstPart[0] + firstPart[1] + '****@' + secoondPart;
  return email;
}
