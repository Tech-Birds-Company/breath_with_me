import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const android = FirebaseOptions(
    apiKey: 'AIzaSyB_74NPMZvM_wamx1AKJoYdnE6AcuPbUOM',
    appId: '1:807142596957:android:e46972b22e7564b46a08b4',
    messagingSenderId: '807142596957',
    projectId: 'breathwithme-5376b',
    databaseURL:
        'https://breathwithme-5376b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'breathwithme-5376b.appspot.com',
  );

  static const ios = FirebaseOptions(
    apiKey: 'AIzaSyDC77wINIsWw_B0VyexjpHCMykUJ9etlrE',
    appId: '1:807142596957:ios:2f7a394f4d21707f6a08b4',
    messagingSenderId: '807142596957',
    projectId: 'breathwithme-5376b',
    databaseURL:
        'https://breathwithme-5376b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'breathwithme-5376b.appspot.com',
    androidClientId:
        '807142596957-4dfund42uq29d4skkqap9panegukb6u3.apps.googleusercontent.com',
    iosClientId:
        '807142596957-8v846cl2kn1j89s5pnfr73lqvghv1rch.apps.googleusercontent.com',
    iosBundleId: 'com.dobry.breathewithme',
  );
}
