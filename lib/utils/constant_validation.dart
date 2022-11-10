/*

 */

///  TODO This method is used to validate email
bool validateEmail(String value) {
  RegExp regex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    caseSensitive: false,
    multiLine: false,
  );
  return (!regex.hasMatch(value)) ? true : false;
}

///  TODO This method is used to validate password
bool validatePassword(String value) {
  RegExp regex = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    caseSensitive: false,
    multiLine: false,
  );
  return (!regex.hasMatch(value)) ? true : false;
}

//
/// TODO This method is used to empty field
bool validateEmptyValue(String value) {
  return value.isEmpty;
}


