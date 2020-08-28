import 'package:email_validator/email_validator.dart';

class BatValidations {
  static BatValidations _instance;

  factory BatValidations() {
    _instance ??= BatValidations._internalConstructor();

    return _instance;
  }

  BatValidations._internalConstructor();

  bool validateName(String name) {
    if (name == null || name.length <= 3) {
      return false;
    }
    return true;
  }

  bool validateEmail(String email) => EmailValidator.validate(email);

  bool validatePassword(String password) {
    if (password == null || password.length <= 6) {
      return false;
    }
    return true;
  }
}
