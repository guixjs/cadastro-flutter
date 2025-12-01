import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  cadUser({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      await user.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'e-mail já cadastrado';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  loginUser({required String email, required String senha}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'usuário não cadastrado';
      }
      if (e.code == 'wrong-password') {
        return 'Credenciais inválidas';
      }
      return "Não foi possível realizar o login no momento";
    } catch (e) {
      return e.toString();
    }
  }

  logoutUser() async {
    await _auth.signOut();
  }
}
