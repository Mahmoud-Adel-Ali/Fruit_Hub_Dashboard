// Required field
String? simpleValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field is required';
  }
  return null;
}


// Min length validation
String? minLengthValidator(String? value, int minLength) {
  if (value == null || value.trim().isEmpty) {
    return 'This field is required';
  }
  if (value.length < minLength) {
    return 'Minimum $minLength characters required';
  }
  return null;
}
