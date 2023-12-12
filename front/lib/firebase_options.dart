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
    apiKey: 'AIzaSyDCXVznwVI_CnJLjZ-eyomiBX1ytKfA2wM',
    appId: '1:404214584937:web:51905c81d66eeef9cb34f8',
    messagingSenderId: '404214584937',
    projectId: 'eventmangaement',
    authDomain: 'eventmangaement.firebaseapp.com',
    storageBucket: 'eventmangaement.appspot.com',
    measurementId: 'G-H0148VEWRF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9fW7n-nYI1B1HKrsPSoqMWeS6JgWkz_E',
    appId: '1:404214584937:android:e007e4ceb0a7d732cb34f8',
    messagingSenderId: '404214584937',
    projectId: 'eventmangaement',
    storageBucket: 'eventmangaement.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDD6tG7Hw9N4EDq3tjCPtgs084kfJNFj54',
    appId: '1:404214584937:ios:6c4e126b8157f8e1cb34f8',
    messagingSenderId: '404214584937',
    projectId: 'eventmangaement',
    storageBucket: 'eventmangaement.appspot.com',
    iosBundleId: 'com.example.front',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDD6tG7Hw9N4EDq3tjCPtgs084kfJNFj54',
    appId: '1:404214584937:ios:2e9ca32ceb0c80cdcb34f8',
    messagingSenderId: '404214584937',
    projectId: 'eventmangaement',
    storageBucket: 'eventmangaement.appspot.com',
    iosBundleId: 'com.example.front.RunnerTests',
  );
}