import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService extends GetxService {

  final auth = FirebaseAuth.instance;

  Future<void> registerCredential (
    final String email, 
    final String password, 
    final Function(UserCredential) onCreate,
    final Function(User?) onCreated,
    final Function() onSuccess,
    final Function(FirebaseAuthException) onFirebaseAuthException,
    final Function(Exception) onException,
  ) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword (
        email: email, password: password,
      );
      onCreate(userCredential);
      final User? user = userCredential.user;
      onCreated(user);
      onSuccess();
    } on FirebaseAuthException catch (exception) {
      onFirebaseAuthException(exception);
    } catch (exception) {
      onException(throw Exception("FirebaseAuthService registerCredential exception ${exception.toString()}}"));
    }
  }

   Future<void> sendEmailVerification(
    final Function() onSuccess,
    final Function(FirebaseAuthException) onFirebaseAuthException,
    final Function(Exception) onException,
   ) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (exception) {
      onFirebaseAuthException(exception);
    } catch (exception) {
      onException(throw Exception("FirebaseAuthService sendEmailVerification exception ${exception.toString()}}"));
    }
  }

  Future<void> checkCredential(
    final String email, 
    final String password,
    final Function(UserCredential) onProcess,
    final Function() onSuccess,
    final Function(Exception) onException,
    final Function() onFinally,
  ) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword (
        email: email, 
        password: password
      );
      onProcess(credential);
      onSuccess();
    } catch (exception) {
      onException(throw Exception("FirebaseAuthService checkCredential exception ${exception.toString()}}"));
    } finally {
      onFinally();
    }
  }
}