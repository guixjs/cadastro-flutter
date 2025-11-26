import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  cadUser({
    required String nome,
    required String email,
    required String senha,
  }) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
    await user.user!.updateDisplayName(nome);
  }

  loginUser({required String email, required String senha}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  logoutUser() async {
    await _auth.signOut();
  }
}
