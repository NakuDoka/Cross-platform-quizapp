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
    apiKey: 'AIzaSyDK5A5sAYNjeOJdupvWlP7z9WO6FBS6LQs',
    appId: '1:31890692171:web:0c9d10b73ba72aee3095ce',
    messagingSenderId: '31890692171',
    projectId: 'tnd-blog-dailyquizapp',
    authDomain: 'tnd-blog-dailyquizapp.firebaseapp.com',
    storageBucket: 'tnd-blog-dailyquizapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrj3JrHEb9a_ak53t7ayzzPr4F12VSKAs',
    appId: '1:31890692171:android:b4c2e789b74ca2d43095ce',
    messagingSenderId: '31890692171',
    projectId: 'tnd-blog-dailyquizapp',
    storageBucket: 'tnd-blog-dailyquizapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrwceijgiZP7XUyLzbsqNmuZkDNDPl2TI',
    appId: '1:31890692171:ios:1caeb47ae93af08a3095ce',
    messagingSenderId: '31890692171',
    projectId: 'tnd-blog-dailyquizapp',
    storageBucket: 'tnd-blog-dailyquizapp.appspot.com',
    iosClientId: '31890692171-dkrem7iv210mb6momk4mofmkkuo2v9as.apps.googleusercontent.com',
    iosBundleId: 'com.example.dailyquiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrwceijgiZP7XUyLzbsqNmuZkDNDPl2TI',
    appId: '1:31890692171:ios:1caeb47ae93af08a3095ce',
    messagingSenderId: '31890692171',
    projectId: 'tnd-blog-dailyquizapp',
    storageBucket: 'tnd-blog-dailyquizapp.appspot.com',
    iosClientId: '31890692171-dkrem7iv210mb6momk4mofmkkuo2v9as.apps.googleusercontent.com',
    iosBundleId: 'com.example.dailyquiz',
  );
}
