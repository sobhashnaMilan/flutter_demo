import 'package:tuple/tuple.dart';

import '../../util/app_logger.dart';

enum ValidationType {
  firstName,
  lastName,
  bio,
  email,
  password,
  confirmPassword,
  phoneNumber,
  none
}

class Validation {
  factory Validation() {
    return _singleton;
  }

  static final Validation _singleton = Validation._internal();

  Validation._internal() {
    Logger().v("Instance created Validation");
  }

  /*Tuple2<bool, String> validateFirstName(String value) {
    String _errorMessage = '';
    if (value.isEmpty) {
      _errorMessage = StringConstant.enterFirstNameValidation;
    } else if (!value.isStringValid()) {
      _errorMessage = StringConstant.enterValidFirstNameValidation;
    }
    return Tuple2(_errorMessage.isEmpty, _errorMessage);
  }

  Tuple2<bool, String> validateEmail(String value) {
    String _errorMessage = '';

    if (value.isEmpty) {
      _errorMessage = StringConstant.enterEmailIDFieldValidation;
    } else if (!value.isStringValid() || !value.isEmail) {
      _errorMessage = StringConstant.enterValidEmailIDFieldValidation;
    }
    return Tuple2(_errorMessage.isEmpty, _errorMessage);
  }

  Tuple2<bool, String> validatePassword(String value) {
    String _errorMessage = '';
    if (value.isEmpty) {
      _errorMessage = StringConstant.enterPasswordFieldValidation;
    } else if (!value.isStringValid(minLength: 6)) {
      _errorMessage = StringConstant.passwordLengthValidation;
    }
    return Tuple2(_errorMessage.isEmpty, _errorMessage);
  }

  Tuple2<bool, String> validateConfirmPassword(String value) {
    String _errorMessage = '';

    if (value.isEmpty) {
      _errorMessage = StringConstant.reEnterPasswordValidation;
    } else if (!value.isStringValid(minLength: 6)) {
      _errorMessage = StringConstant.passwordLengthValidation;
    }
    return Tuple2(_errorMessage.isEmpty, _errorMessage);
  }

  Tuple2<bool, String> validatePasswordMatch(String password, String confirmPassword) {
    String _errorMessage = '';

    if (password != confirmPassword) {
      _errorMessage = StringConstant.passwordsNotMatchValidation;
    }
    return Tuple2(_errorMessage.isEmpty, _errorMessage);
  }

  Tuple2<bool, String> validateBio(String value) {
    String _errorMessage = '';

    if (value.isEmpty) {
      _errorMessage = StringConstant.enterBioValidation;
    } else if (!value.isStringValid()) {
      _errorMessage = StringConstant.enterValidBioValidation;
    }
    return Tuple2(_errorMessage.isEmpty, _errorMessage);
  }

  Tuple2<bool, String> validatePhoneNumber(String value) {
    String _errorMessage = '';
    if (value.isEmpty) {
      _errorMessage = StringConstant.enterMobileNoValidation;
    } else if (!value.isStringValid(minLength: 10)) {
      _errorMessage = StringConstant.enterValidMobileNoValidation;
    }
    return Tuple2(_errorMessage.isEmpty, _errorMessage);
  }*/

  Tuple3<bool, String, ValidationType> checkValidationForTextFieldWithType(
      {List<Tuple2<ValidationType, String>>? list}) {
    Tuple3<bool, String, ValidationType> isValid =
        const Tuple3(true, '', ValidationType.none);

    for (Tuple2<ValidationType, String> textOption in list ?? []) {
      /*if (textOption.item1 == ValidationType.firstName) {
        final res = validateFirstName(textOption.item2);
        isValid = Tuple3(res.item1, res.item2, ValidationType.firstName);
      } else if (textOption.item1 == ValidationType.lastName) {
        final res = validateLastName(textOption.item2);
        isValid = Tuple3(res.item1, res.item2, ValidationType.lastName);
      } else if (textOption.item1 == ValidationType.bio) {
        final res = validateBio(textOption.item2);
        isValid = Tuple3(res.item1, res.item2, ValidationType.bio);
      } else if (textOption.item1 == ValidationType.phoneNumber) {
        final res = validatePhoneNumber(textOption.item2);
        isValid = Tuple3(res.item1, res.item2, ValidationType.phoneNumber);
      } else if (textOption.item1 == ValidationType.email) {
        final res = validateEmail(textOption.item2);
        isValid = Tuple3(res.item1, res.item2, ValidationType.email);
      } else if (textOption.item1 == ValidationType.password) {
        final res = validatePassword(textOption.item2);
        isValid = Tuple3(res.item1, res.item2, ValidationType.password);
      } else if (textOption.item1 == ValidationType.confirmPassword) {
        final res = validateConfirmPassword(textOption.item2);
        isValid = Tuple3(res.item1, res.item2, ValidationType.confirmPassword);
      }*/

      if (!isValid.item1) {
        break;
      }
    }
    return isValid;
  }
}
