import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_manager/screen/login/Sign_In.dart';


class AuthHelper {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static signInWithEmail({String email, String password}) async {
    final res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = res.user;
    return user;
  }

  static signupWithEmail({String email, String password}) async {
    final res = await _auth.createUserWithEmailAndPassword(
     email: email, password: password);
    final User user = res.user;
    return user;
  }
  static signOut() {
    
    return _auth.signOut();
  }

}