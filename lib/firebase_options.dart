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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAlzr2T-ey1XTzbRlCiI079Jd5r_ZCw0S8',
    appId: '1:763369639853:web:5751f517866e5795f19b24',
    messagingSenderId: '763369639853',
    projectId: 'notes-db0d8',
    authDomain: 'notes-db0d8.firebaseapp.com',
    storageBucket: 'notes-db0d8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1FB8LZ_17pXA4tlX0nKowDhcktccJIJg',
    appId: '1:763369639853:android:30f84d74d7a17995f19b24',
    messagingSenderId: '763369639853',
    projectId: 'notes-db0d8',
    storageBucket: 'notes-db0d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXRAVP01oIboxgwZ_eM0lxEqt1BCi33VU',
    appId: '1:763369639853:ios:131dde296e06e5b4f19b24',
    messagingSenderId: '763369639853',
    projectId: 'notes-db0d8',
    storageBucket: 'notes-db0d8.appspot.com',
    iosBundleId: 'com.example.notesapp',
  );
}
