class FormField<T> {
  T value;
  final List<String? Function(T)> validators;
  String? error;

  FormField({
    required this.value,
    this.validators = const [],
  });

  bool validate() {
    // اگر value null است و validators خالی است، valid است
    if (value == null && validators.isEmpty) {
      error = null;
      return true;
    }
    for (final v in validators) {
      final result = v(value);
      // print("validating:$value is $result");
      if (result != null) {
        error = result;
        return false;
      }
    }
    error = null;
    return true;
  }

  void set(T newValue) {
    value = newValue;
    validate();
  }
}
