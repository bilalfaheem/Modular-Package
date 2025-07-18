class Validator {
  static bool _isFullName(String name) {
    String r = r'^[a-zA-Z]+$';
    RegExp regExp = RegExp(r);

    return !regExp.hasMatch(name);
  }

  static bool _isEmail(String email) {
    String r =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(r);

    return !regExp.hasMatch(email);
  }

  static bool _isPhone(String phone) {
    // String r = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String r = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    RegExp regExp = RegExp(r);

    return !regExp.hasMatch(phone);
  }

  static String? validate(String value, String type) {
    if (value == "") {
      return "Please enter $type";
    } else {
      return null;
    }
  }

  static validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must contain at least 8 characters";
    } else if (value.length > 16) {
      return "Password length should be less than 16";
    } else {
      return null;
    }
  }

  static validatePasswordType(String value, String type) {
    if (value.isEmpty) {
      return "$type password is required";
    } else if (value.length < 8) {
      return "$type password must contain at least 8 characters";
    } else if (value.length > 16) {
      return "$type password length should be less than 16";
    } else {
      return null;
    }
  }

  static String? validateImage(String value, String type) {
    if (value == "") {
      return "Please Upload $type";
    } else {
      return null;
    }
  }

  static String? validateEmail(
    String value,
  ) {
    if (value == "") {
      return "Please enter email address";
    } else if (_isEmail(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  static String? validatePhone(String value, String type) {
    if (value == "") {
      return "Please enter your $type number";
    } else if (_isPhone(value)) {
      return "Please enter a valid $type Number";
    } else if (value.length < 8) {
      return "$type Number length should be greater than 8 digits";
    } else if (value.length > 15) {
      return "$type Number length should be less than 15 digits";
    } else {
      return null;
    }
  }

  static String? validateFullName(String value, String type) {
    if (value.isEmpty) {
      return "Please enter your $type name";
    } else if (_isFullName(value)) {
      return "Please enter a valid $type name";
    } else if (value.length < 3) {
      return "Please enter a valid $type name";
    } else {
      return null;
    }
  }
}
