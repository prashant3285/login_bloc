import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get sumbitValid =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  Function(String) get emailChange => _email.sink.add;
  Function(String) get passwordChange => _password.sink.add;

  submit() {
    final email = _email.value;
    final password = _password.value;

    print('Email: $email');
    print('Passowrd: $password');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
