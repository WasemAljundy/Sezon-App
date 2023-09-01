import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBw2vqRFlo0ONUn-uSn3tfda_E_DNMoiTk',
    appId: '1:485923650572:web:bc9b73fa3cba8580264229',
    messagingSenderId: '485923650572',
    projectId: 'sezon-app-1bb64',
    authDomain: 'sezon-app-1bb64.firebaseapp.com',
    storageBucket: 'sezon-app-1bb64.appspot.com',
    measurementId: 'G-WRZ3CYG3XB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALXb9X1qujUNMo8_bwWKxSCCya_48P7AU',
    appId: '1:485923650572:android:9fdf4bf07873ddc0264229',
    messagingSenderId: '485923650572',
    projectId: 'sezon-app-1bb64',
    storageBucket: 'sezon-app-1bb64.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDybsuctRBnWcF-ZF1GDWLhCV5kUF1_hqc',
    appId: '1:485923650572:ios:26111caa2262422e264229',
    messagingSenderId: '485923650572',
    projectId: 'sezon-app-1bb64',
    storageBucket: 'sezon-app-1bb64.appspot.com',
    iosClientId: '485923650572-4i1kcmocp3em3kehuqbdv6rtrq2phsf8.apps.googleusercontent.com',
    iosBundleId: 'com.wasem.sezonApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDybsuctRBnWcF-ZF1GDWLhCV5kUF1_hqc',
    appId: '1:485923650572:ios:860b0f37d14b555a264229',
    messagingSenderId: '485923650572',
    projectId: 'sezon-app-1bb64',
    storageBucket: 'sezon-app-1bb64.appspot.com',
    iosClientId: '485923650572-ilfbrv60eij2iam4pecksvoc11p7k93p.apps.googleusercontent.com',
    iosBundleId: 'com.wasem.sezonApp.RunnerTests',
  );
}
