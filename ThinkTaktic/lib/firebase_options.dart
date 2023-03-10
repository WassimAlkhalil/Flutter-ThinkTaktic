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
    apiKey: 'AIzaSyB1i6c5a3X5OsixSqVc5BnP-E8WEl_QyeQ',
    appId: '1:483700425039:web:a17afc21d8a2cf1904453a',
    messagingSenderId: '483700425039',
    projectId: 'notes-87e72',
    authDomain: 'notes-87e72.firebaseapp.com',
    storageBucket: 'notes-87e72.appspot.com',
    measurementId: 'G-NL72XYPCV9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOIXyk0zbC4Qof0vofc5ZkMgqt93FJTyE',
    appId: '1:483700425039:android:d02e61421df3205d04453a',
    messagingSenderId: '483700425039',
    projectId: 'notes-87e72',
    storageBucket: 'notes-87e72.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD_9mmVjYtXQ5a5-4pJm1bbIjrqfd3TdM',
    appId: '1:483700425039:ios:1c91151a614ddcfd04453a',
    messagingSenderId: '483700425039',
    projectId: 'notes-87e72',
    storageBucket: 'notes-87e72.appspot.com',
    iosClientId: '483700425039-i3f6hpb6sb2m4p4v1psjn95fh0k3t59o.apps.googleusercontent.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD_9mmVjYtXQ5a5-4pJm1bbIjrqfd3TdM',
    appId: '1:483700425039:ios:1c91151a614ddcfd04453a',
    messagingSenderId: '483700425039',
    projectId: 'notes-87e72',
    storageBucket: 'notes-87e72.appspot.com',
    iosClientId: '483700425039-i3f6hpb6sb2m4p4v1psjn95fh0k3t59o.apps.googleusercontent.com',
    iosBundleId: 'com.example.notes',
  );
}
