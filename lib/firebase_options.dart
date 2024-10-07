// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


// ...

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
    apiKey: 'AIzaSyByJt_OSSzURKvHvLYPLiBDAjNpXIv_ZaY',
    appId: '1:163452173602:web:e06601136d55cab7f8f97b',
    messagingSenderId: '163452173602',
    projectId: 'booktikcket',
    authDomain: 'booktikcket.firebaseapp.com',
    databaseURL: 'https://booktikcket-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'booktikcket.appspot.com',
    measurementId: 'G-ZW3NHBR0N2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMbii_NFc-gFupuE4p5SGjQHEukySMlZU',
    appId: '1:163452173602:android:5366fd813d431e18f8f97b',
    messagingSenderId: '163452173602',
    projectId: 'booktikcket',
    databaseURL: 'https://booktikcket-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'booktikcket.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9UTekGBSY5b5r8RAmufLz9qnCMW_3TaY',
    appId: '1:163452173602:ios:dfc168c6b7be065cf8f97b',
    messagingSenderId: '163452173602',
    projectId: 'booktikcket',
    databaseURL: 'https://booktikcket-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'booktikcket.appspot.com',
    iosClientId: '163452173602-782aev2heao9uco10hbg6i0q1ik6lhlc.apps.googleusercontent.com',
    iosBundleId: 'com.rdlmar.bookticket',
  );
}