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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDNVx49tAQozB5DqZJIkp3REfg1mNeQyv4',
    appId: '1:373433222823:web:36f7a860938c1cb8d13d82',
    messagingSenderId: '373433222823',
    projectId: 'mynotes-f',
    authDomain: 'mynotes-f.firebaseapp.com',
    storageBucket: 'mynotes-f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiqBDt9IlnouUNvzd_l34Yj02KeX0VCbk',
    appId: '1:373433222823:android:3cd65e4703db1dd8d13d82',
    messagingSenderId: '373433222823',
    projectId: 'mynotes-f',
    storageBucket: 'mynotes-f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqSN6cHjsZEI6n3Mrji2Jm9uCOCTNKXXo',
    appId: '1:373433222823:ios:f4f3a40bcb647528d13d82',
    messagingSenderId: '373433222823',
    projectId: 'mynotes-f',
    storageBucket: 'mynotes-f.appspot.com',
    iosClientId: '373433222823-9nqkgfue8rlmoapunkatr82vfvahvokh.apps.googleusercontent.com',
    iosBundleId: 'ba.mynotes',
  );
}