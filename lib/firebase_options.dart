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
    apiKey: 'AIzaSyBw7FDoFeMv9ZaxX2PUPH2ggkOXKBldork',
    appId: '1:266756369057:web:cbe5f9c7e93b844e9bdee0',
    messagingSenderId: '266756369057',
    projectId: 'pokemon-app-5c26c',
    authDomain: 'pokemon-app-5c26c.firebaseapp.com',
    storageBucket: 'pokemon-app-5c26c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWLTXOp2CoNy8kQ8_-2qSglGLaa-QFM3M',
    appId: '1:266756369057:android:e726e406e8c972469bdee0',
    messagingSenderId: '266756369057',
    projectId: 'pokemon-app-5c26c',
    storageBucket: 'pokemon-app-5c26c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDq6mV87fawUvUeZcKfGukULwAGhiHQMdY',
    appId: '1:266756369057:ios:9f4336f02c8485cc9bdee0',
    messagingSenderId: '266756369057',
    projectId: 'pokemon-app-5c26c',
    storageBucket: 'pokemon-app-5c26c.appspot.com',
    iosClientId: '266756369057-ph3n2caqgukodo8t9acbnk5shgehe16p.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiLearning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDq6mV87fawUvUeZcKfGukULwAGhiHQMdY',
    appId: '1:266756369057:ios:9f4336f02c8485cc9bdee0',
    messagingSenderId: '266756369057',
    projectId: 'pokemon-app-5c26c',
    storageBucket: 'pokemon-app-5c26c.appspot.com',
    iosClientId: '266756369057-ph3n2caqgukodo8t9acbnk5shgehe16p.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiLearning',
  );
}