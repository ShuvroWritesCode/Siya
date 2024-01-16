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
      apiKey: "AIzaSyAEfsTOgSzS3fydmj0ZmwB3dptoCIN6MYI",
      authDomain: "siya-1a39d.firebaseapp.com",
      projectId: "siya-1a39d",
      storageBucket: "siya-1a39d.appspot.com",
      messagingSenderId: "676764122238",
      appId: "1:676764122238:web:685aaa7acc77adb6542c2f",
      measurementId: "G-SZCTJN63MY"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCogmtZENyaIKKeydEoZIfcX1ulyVRv-QE',
    appId: '1:676764122238:android:564fbe6107dadd9f542c2f',
    messagingSenderId: '676764122238',
    projectId: 'siya-1a39d',
    storageBucket: 'siya-1a39d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmSPrIYNzyaFFYKbx_NjXCVAB8ORyg2BQ',
    appId: '1:676764122238:ios:32951fe0fde8563e542c2f',
    messagingSenderId: '676764122238',
    projectId: 'siya-1a39d',
    storageBucket: 'siya-1a39d.appspot.com',
    // iosClientId: '476872845583-okgcgeu1phos03r6c3ombdtskjdp91s4.apps.googleusercontent.com',
    iosBundleId: 'com.example.siya',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmSPrIYNzyaFFYKbx_NjXCVAB8ORyg2BQ',
    appId: '1:676764122238:ios:32951fe0fde8563e542c2f',
    messagingSenderId: '676764122238',
    projectId: 'siya-1a39d',
    storageBucket: 'siya-1a39d.appspot.com',
    // iosClientId: '476872845583-okgcgeu1phos03r6c3ombdtskjdp91s4.apps.googleusercontent.com',
    iosBundleId: 'com.example.siya',
  );
}