import 'dart:convert';

extension RemoteConfig on String? {
  Map<String, dynamic> get asJson =>
      jsonDecode(this?.isEmpty ?? true ? '{}' : this!) as Map<String, dynamic>;
}

extension EmailValidator on String? {
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (this == null) {
      return false;
    }
    return emailRegex.hasMatch(this!);
  }
}
