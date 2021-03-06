import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_demo/src/blocs/validators.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //final _email = StreamController<String>.broadcast();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print(validEmail);
    print(validPassword);
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
