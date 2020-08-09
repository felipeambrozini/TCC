import 'package:email_validator/email_validator.dart';

class Validations {
  static Validations _instance;

  factory Validations() {
    _instance ??= Validations._internalConstructor();

    return _instance;
  }

  //Empty constructor
  Validations._internalConstructor();

  bool validateEmail(String email) => EmailValidator.validate(email);

  bool validatePassword(String passWord) {
    if (passWord.length != 6) {
      return false;
    }
    return true;
  }

  bool validateMonth(String month) {
    if (month.length < 2) {
      return false;
    }
    int parsed = int.tryParse(month);
    if (parsed == null) {
      return false;
    }
    if (parsed == 0) {
      return false;
    }
    if (parsed > 12) {
      return false;
    }
    return true;
  }

  bool validateYear(String year) {
    if (year.length < 4) {
      return false;
    }
    int parsed = int.tryParse(year);
    if (parsed == null) {
      return false;
    }
    if (parsed == 0) {
      return false;
    }
    return true;
  }

  bool validateDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateTime dateNow = DateTime.now();
    final difference = date.difference(dateNow).inDays;
    String validate =
        '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    return validate == dateString && difference < 0;
  }

  String getMonth(int month) {
    if (month == 1) {
      return 'Janeiro';
    } else if (month == 2) {
      return 'Fevereiro';
    } else if (month == 3) {
      return 'Março';
    } else if (month == 4) {
      return 'Abril';
    } else if (month == 5) {
      return 'Maio';
    } else if (month == 6) {
      return 'Junho';
    } else if (month == 7) {
      return 'Julho';
    } else if (month == 8) {
      return 'Agosto';
    } else if (month == 9) {
      return 'Setembro';
    } else if (month == 10) {
      return 'Outubro';
    } else if (month == 11) {
      return 'Novembro';
    } else {
      return 'Dezembro';
    }
  }
}
