import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class JwtMmnewsAuthUser {
  JwtMmnewsAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<JwtMmnewsAuthUser> jwtMmnewsAuthUserSubject =
    BehaviorSubject.seeded(JwtMmnewsAuthUser(loggedIn: false));
Stream<JwtMmnewsAuthUser> jwtMmnewsAuthUserStream() => jwtMmnewsAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
