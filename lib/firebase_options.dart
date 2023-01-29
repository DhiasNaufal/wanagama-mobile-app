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
    apiKey: 'AIzaSyBCPa99qyD0HVFGSLj94CUPxSMv9Th94wc',
    appId: '1:1020217176965:web:3e54fb04cfaa89d9780aec',
    messagingSenderId: '1020217176965',
    projectId: 'wanagamabookingapp',
    authDomain: 'wanagamabookingapp.firebaseapp.com',
    storageBucket: 'wanagamabookingapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKbJ49o6C7HzbW_m1gb8of41vr7IiQvqQ',
    appId: '1:1020217176965:android:b1547639d9c5cc26780aec',
    messagingSenderId: '1020217176965',
    projectId: 'wanagamabookingapp',
    storageBucket: 'wanagamabookingapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiBfo0aWIHscw1qUGNNam0UTMvMkzKh1A',
    appId: '1:1020217176965:ios:eb99e13c69195ee7780aec',
    messagingSenderId: '1020217176965',
    projectId: 'wanagamabookingapp',
    storageBucket: 'wanagamabookingapp.appspot.com',
    iosClientId: '1020217176965-6jlb0qlk2rg5aeigdk24dncdjnkscovn.apps.googleusercontent.com',
    iosBundleId: 'com.example.wanagamaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiBfo0aWIHscw1qUGNNam0UTMvMkzKh1A',
    appId: '1:1020217176965:ios:eb99e13c69195ee7780aec',
    messagingSenderId: '1020217176965',
    projectId: 'wanagamabookingapp',
    storageBucket: 'wanagamabookingapp.appspot.com',
    iosClientId: '1020217176965-6jlb0qlk2rg5aeigdk24dncdjnkscovn.apps.googleusercontent.com',
    iosBundleId: 'com.example.wanagamaApp',
  );
}
