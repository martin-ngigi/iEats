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
    apiKey: 'AIzaSyDMqpb4nfeCYQyJyLH_157-LAj8mbCqBQs',
    appId: '1:342155532841:web:4640fa1d63a763f407da38',
    messagingSenderId: '342155532841',
    projectId: 'ieats1',
    authDomain: 'ieats1.firebaseapp.com',
    storageBucket: 'ieats1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6XPcXiIOwjDmaycTmuZZfcgNI0sDHFtQ',
    appId: '1:342155532841:android:f7af060b4b7bf83807da38',
    messagingSenderId: '342155532841',
    projectId: 'ieats1',
    storageBucket: 'ieats1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrdCMGs7Muj_SsPNfTbSC2B33p4tlGMFY',
    appId: '1:342155532841:ios:690d8dde3f7af00407da38',
    messagingSenderId: '342155532841',
    projectId: 'ieats1',
    storageBucket: 'ieats1.appspot.com',
    iosClientId: '342155532841-re8b832thk5g4kldca85dspu49kfh58i.apps.googleusercontent.com',
    iosBundleId: 'com.example.iEats',
  );
}