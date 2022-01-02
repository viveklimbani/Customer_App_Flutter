import 'package:string_validator/string_validator.dart';

class Validator {
  bool emailVerification(String value) {
    return value.trim().isEmpty || !isEmail(value);
  }

  bool passwordVerification(String value) {
    RegExp regExp = RegExp(
        r"^.*(?=.{8,})((?=.*[!@#$%^&*()\-_=+{};:,<.>]){1})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$");
    return regExp.hasMatch(value);
  }

  bool emptyFieldVerification(String value) {
    return value.trim().isEmpty;
  }

  bool nullFieldValidation(dynamic value) {
    return value == null;
  }

  bool compareTwoStrings(String value1, String value2) {
    return value1 == value2;
  }

}
