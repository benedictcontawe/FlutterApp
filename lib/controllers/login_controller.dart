import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/firebase/firebase_auth_service.dart';
import 'package:getx_storage/routes/app_pages.dart';
import 'package:getx_storage/util/constants.dart';

class LoginController extends BaseController {

  LoginController(FirebaseAuthService this._auth,) {
    debugPrint("LoginController constructor");
  }

  //#region Firabase Instances
  final FirebaseAuthService _auth;
  //#endregion
  TextEditingController? emailController, passwordController, phoneController, codeController;
  final RxBool _isPasswordHidden = true.obs;
  String? _verificationId;

  @override
  void onInit() {
    super.onInit();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    phoneController = new TextEditingController();
    codeController = new TextEditingController();
  }

  void onTogglePasswordVisibility() {
    _isPasswordHidden.toggle();
  }

  RxBool observePasswordHidden() {
    return _isPasswordHidden;
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> onCheckCredential() async {
    debugPrint("LoginController checkCredential");    
    // Validate email and password
    if (emailController?.text.isEmpty ?? true) {
      onShowAlert("Validation Error", "Please enter your email address");
      return;
    }    
    if (passwordController?.text.isEmpty ?? true) {
      onShowAlert("Validation Error", "Please enter your password");
      return;
    }    
    if (!GetUtils.isEmail(emailController?.text ?? "")) {// Validate email format
      onShowAlert("Validation Error", "Please enter a valid email address");
      return;
    }    
    _auth.checkCredential (
      emailController?.text ?? "", 
      passwordController?.text ?? "",
      (userCredential) {
        debugPrint("LoginController checkCredential credential ${userCredential.toString()}");
        debugPrint("LoginController checkCredential user ${userCredential.user}");
      }, 
      () {
        onShowSuccess("Success!", "Login successful. Welcome back!");
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.offAndToNamed(Routes.MAIN);
        });
      },
      (exception) {
        debugPrint('LoginController checkCredential exception ${exception.toString()}}');        
        // Handle specific Firebase Auth exceptions
        if (exception is FirebaseAuthException) {
          String errorMessage = "Login failed. Please try again.";          
          switch (exception.code) {
            case 'user-not-found':
              errorMessage = "No account found with this email address.";
              break;
            case 'wrong-password':
              errorMessage = "Incorrect password. Please try again.";
              break;
            case 'invalid-email':
              errorMessage = "Invalid email address format.";
              break;
            case 'user-disabled':
              errorMessage = "This account has been disabled.";
              break;
            case 'too-many-requests':
              errorMessage = "Too many failed attempts. Please try again later.";
              break;
            case 'network-request-failed':
              errorMessage = "Network error. Please check your connection.";
              break;
            default:
              errorMessage = "Login failed: ${exception.message ?? 'Unknown error'}";
          }          
          onShowAlert("Login Failed", errorMessage);
        } else {
          onShowAlert("Error!", "Login failed. Please try again.");
        }
      },
      () {},
    );
  }

  Future<void> checkGoogleCredentials() async  {
    /*
    isLoading(true);
    debugPrint("LoginController checkGoogleTechLeadCredentials");
    final UserCredential? googleCredential = await _auth.signInWithGoogle();
    final UserModel? user = await _service.getUserModel(_auth.getUser()?.uid);
    if (googleCredential != null && user != null) {
      debugPrint("LoginController checkGoogleTechLeadCredentials success!");
      Get.offAndToNamed(Routes.DASHBOARDLEADER);
    } else if (googleCredential != null && user == null) {
      debugPrint("LoginController checkGoogleTechLeadCredentials creatting success!");
      final User? user = _auth.getUser();
      _service.createUserModel(TechLeaderModel(
        uid: user?.uid,
        name: user?.displayName,
        email: user?.email,
      ).toMap());
      Get.offAndToNamed(Routes.DASHBOARDLEADER);
    } else {
      debugPrint("LoginController checkGoogleTechLeadCredentials error!");
      onShowAlert("Error!", "Invalid Google User, Please Login as a Google User");
      isLoading(false);
    }
    */
  }

  bool _isValidPhoneNumber(String? phoneNumber) {
    final RegExp regex = RegExp(r'^\+?[1-9]\d{1,14}$');
    if(phoneNumber != null && regex.hasMatch(phoneNumber)) return true;
    else return false;
  }

  Future<void> onCheckPhoneCredential() async {
    debugPrint("LoginController onCheckPhoneCredential ${phoneController?.text}");    
    if (phoneController?.text.isEmpty ?? true) {
      onShowAlert("Validation Error", "Please enter your phone number");
      return;
    }    
    if(_isValidPhoneNumber(phoneController?.text)) {
      _auth.verifyPhoneNumber (
        phoneController?.text ?? "",
        const Duration(minutes: 1),
        (phoneAuthCredential) async {
          debugPrint("LoginController onVerificationCompleted $phoneAuthCredential");
          onShowSuccess("Success!", "Phone verification completed");
        },
        (verificationId, [resendToken]) {
          debugPrint("LoginController onCodeSent $verificationId $resendToken");
          _verificationId = verificationId;
          onShowSuccess("Code Sent", "Verification code has been sent to your phone");
          //_isPhoneReadOnly(true);
          //_isCodeReadOnly(false);
        },
        (verificationId, ) {
          debugPrint("LoginController onCodeAutoRetrievalTimeout $verificationId");
          _verificationId = verificationId;
        },
        (exception) {
          debugPrint('LoginController checkCredential exception ${exception.toString()}}');          
          if (exception is FirebaseAuthException) {
            String errorMessage = "Phone verification failed. Please try again.";            
            switch (exception.code) {
              case 'invalid-phone-number':
                errorMessage = "Invalid phone number format.";
                break;
              case 'too-many-requests':
                errorMessage = "Too many requests. Please try again later.";
                break;
              case 'quota-exceeded':
                errorMessage = "SMS quota exceeded. Please try again later.";
                break;
              default:
                errorMessage = "Phone verification failed: ${exception.message ?? 'Unknown error'}";
            }            
            onShowAlert("Verification Failed", errorMessage);
          } else {
            onShowAlert("Error!", "Phone verification failed. Please try again.");
          }
        }
      );
    } else {
      onShowAlert("Validation Error", "Please enter a valid phone number (e.g., +1234567890)");
    }
  }

  Future<void> onCheckCode() async {
    debugPrint("LoginController onCheckCode");
    if (codeController?.text.isEmpty ?? true) {
      onShowAlert("Validation Error", "Please enter the verification code");
      return;
    }
    if (_verificationId == null || _verificationId!.isEmpty) {
      onShowAlert("Error!", "Verification ID not found. Please request a new code.");
      return;
    }    
    _auth.signInWithPhoneNumber (
      _verificationId ?? Constants.BLANK, 
      codeController?.text ?? Constants.BLANK, 
      () {
        onShowSuccess("Success!", "Phone login successful. Welcome!");
        Future.delayed(const Duration(milliseconds: 500), () {
          //Get.offAndToNamed(Routes.DASHBOARD)
          Get.offAndToNamed(Routes.MAIN);
        });
      },
      (exception) {
        debugPrint('LoginController onCheckCode exception ${exception.toString()}}');
        if (exception is FirebaseAuthException) {
          String errorMessage = "Code verification failed. Please try again.";
          switch (exception.code) {
            case 'invalid-verification-code':
              errorMessage = "Invalid verification code. Please check and try again.";
              break;
            case 'session-expired':
              errorMessage = "Verification session expired. Please request a new code.";
              break;
            default:
              errorMessage = "Code verification failed: ${exception.message ?? 'Unknown error'}";
          }          
          onShowAlert("Verification Failed", errorMessage);
        } else {
          onShowAlert("Error!", "Code verification failed. Please try again.");
        }
      }
    );
  }

  void launchRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  @override
  void onClose() {
    super.onClose();
    emailController?.dispose();
    passwordController?.dispose();
    phoneController?.dispose();
    codeController?.dispose();
  }
}