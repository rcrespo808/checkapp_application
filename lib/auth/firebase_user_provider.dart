import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CheckappBaseFirebaseUser {
  CheckappBaseFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

CheckappBaseFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CheckappBaseFirebaseUser> checkappBaseFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CheckappBaseFirebaseUser>(
            (user) => currentUser = CheckappBaseFirebaseUser(user));
