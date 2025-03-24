class AppValidation {
  static String? emptyValue(String? value) {
    if (value == null || value.isEmpty) {
      return "";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    // if (value == null || value.isEmpty) {
    //   return 'Email is required';
    // }
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$';
    if (!RegExp(emailRegex).hasMatch(value ?? "")) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    const phoneRegex = r'^\d{10}$';
    if (!RegExp(phoneRegex).hasMatch(value.trim())) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }
}
