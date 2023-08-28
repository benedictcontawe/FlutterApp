// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCvumnNhvCjbHMV_RUSVCXf8xhKhdEkeeE',
    appId: '1:114119225553:web:989f0f9cb96940f18fd5f0',
    messagingSenderId: '114119225553',
    projectId: 'flutterapp-419b8',
    authDomain: 'flutterapp-419b8.firebaseapp.com',
    databaseURL: 'https://flutterapp-419b8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterapp-419b8.appspot.com',
    measurementId: 'G-0969VEYM4W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpSHgMvKw6-wGVx_zd1zx_9mVkxAiG2K8',
    appId: '1:114119225553:android:f4f330675218ef668fd5f0',
    messagingSenderId: '114119225553',
    projectId: 'flutterapp-419b8',
    databaseURL: 'https://flutterapp-419b8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterapp-419b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCG7MJbTox-VmQDu1gc6yl_FW1dL7JhDiQ',
    appId: '1:114119225553:ios:428d9f18f1d2973b8fd5f0',
    messagingSenderId: '114119225553',
    projectId: 'flutterapp-419b8',
    databaseURL: 'https://flutterapp-419b8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterapp-419b8.appspot.com',
    iosClientId: '114119225553-8jgrg4ebi2kckq9kb0oi81ciitrqsr28.apps.googleusercontent.com',
    iosBundleId: 'com.sample.getxStorage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCG7MJbTox-VmQDu1gc6yl_FW1dL7JhDiQ',
    appId: '1:114119225553:ios:428d9f18f1d2973b8fd5f0',
    messagingSenderId: '114119225553',
    projectId: 'flutterapp-419b8',
    databaseURL: 'https://flutterapp-419b8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterapp-419b8.appspot.com',
    iosClientId: '114119225553-8jgrg4ebi2kckq9kb0oi81ciitrqsr28.apps.googleusercontent.com',
    iosBundleId: 'com.sample.getxStorage',
  );
}