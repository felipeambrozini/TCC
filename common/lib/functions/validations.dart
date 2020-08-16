import 'package:email_validator/email_validator.dart';

class Validations {
  static Validations _instance;

  factory Validations() {
    _instance ??= Validations._internalConstructor();

    return _instance;
  }

  Validations._internalConstructor();

  bool validateEmail(String email) => EmailValidator.validate(email);

}
