class FieldsValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@') || !value.contains('.com')) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 5) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }

    return null;
  }
}
