import 'dart:async';
import '../validators/validator.dart';

class Bloc extends Object with Validator {
  final _email = new StreamController();
  final _password = new StreamController();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get emailChange => _email.sink.add;
  Function(String) get passwordChange => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}
