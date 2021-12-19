import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        apiKey: 'AIzaSyDDmOwElAl8ploSqyIclTNkrNGtyG-SVJc',
        appId: '1:358029438538:web:ef04606b90715959cd00b3',
        messagingSenderId: '358029438538',
        projectId: 'procaryote-1',
        authDomain: 'procaryote-1.firebaseapp.com',
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        apiKey: 'AIzaSyCUcCiIgXJ05KFBV9Y0KOAQMzgdXDQrp88',
        appId: '1:358029438538:ios:07294703a535e117cd00b',
        messagingSenderId: '358029438538',
        projectId: 'procaryote-1',
        authDomain: 'procaryote-1.firebaseapp.com',
        iosBundleId: 'io.flutter.plugins.firebase.auth',
        databaseURL: 'https://procaryote-1.firebaseio.com',
        iosClientId:
            '358029438538-jamtq61jiehtpg733h3uu0u2ckp7gssl.apps.googleusercontent.com',
        androidClientId:
            '358029438538-l4h86aabdrab31nuikod18shjkumckpv.apps.googleusercontent.com',
        storageBucket: 'procaryote-1.appspot.com',
      );
    } else {
      // Android
      return const FirebaseOptions(
        apiKey: 'AIzaSyB3RTIoOgXvL-6O1aQhrN4FrAefydTpH08',
        appId: '1:358029438538:android:fc6a4ddbc51e5498cd00b3',
        messagingSenderId: '358029438538',
        projectId: 'procaryote-1',
        authDomain: 'procaryote-1.firebaseapp.com',
        databaseURL: 'https://procaryote-1.firebaseio.com',
        androidClientId:
            '358029438538-l4h86aabdrab31nuikod18shjkumckpv.apps.googleusercontent.com',
      );
    }
  }
}
