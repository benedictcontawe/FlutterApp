import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService extends GetxService {

  final _auth = FirebaseAuth.instance;

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
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword (
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

   Future<void> sendEmailVerification (
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

  Future<void> verifyPhoneNumber(
    String phoneNumber,
    Duration timeout,
    final Function(PhoneAuthCredential) onVerificationCompleted,
    final Function(String, [int?]) onCodeSent,
    final Function(String, ) onCodeAutoRetrievalTimeout,
    final Function(Exception) onException,
  ) async {
    _auth.verifyPhoneNumber (
      phoneNumber: phoneNumber,
      timeout: timeout,
      verificationCompleted: (credential) async => onVerificationCompleted(credential),
      verificationFailed: ((firebaseAuthException) => onException(throw Exception("FirebaseAuthService verifyPhoneNumber verificationFailed ${firebaseAuthException.code} ${firebaseAuthException.message}"))), 
      codeSent: (verificationId, [forceResendingToken]) async => onCodeSent(verificationId, forceResendingToken),
      codeAutoRetrievalTimeout: ((verificationId) => onException(throw Exception("FirebaseAuthService verifyPhoneNumber codeAutoRetrievalTimeout $verificationId"))),
    );
  }

  Future<void> signInWithPhoneNumber(String verificationId, String code, final Function() onSuccess, final Function(Object) onException,) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential (verificationId: verificationId, smsCode: code,);
    _auth.signInWithCredential(credential);
    try {
      _auth.signInWithCredential(credential);
      await (_auth.currentUser)?.updatePhoneNumber(credential);
      onSuccess();
    } catch(exception) {
      onException(exception);
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
      final UserCredential credential = await _auth.signInWithEmailAndPassword (
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

  User? getUser() {
    return _auth.currentUser;
  }

  bool isUserSignedIn() {
    return getUser() != null ? true : false;
  }

  Future signOut() async {
    await _auth.signOut();
  }
}