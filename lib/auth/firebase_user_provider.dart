import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DectaFirebaseUser {
  DectaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DectaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DectaFirebaseUser> dectaFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DectaFirebaseUser>(
      (user) {
        currentUser = DectaFirebaseUser(user);
        return currentUser!;
      },
    );
