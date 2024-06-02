import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAXFZXGUp1m2e6j4mKk9m0XkIRfNl5JehM",
            authDomain: "netcare-73e0b.firebaseapp.com",
            projectId: "netcare-73e0b",
            storageBucket: "netcare-73e0b.appspot.com",
            messagingSenderId: "363037802045",
            appId: "1:363037802045:web:9216341bc1dbc7ff9eb454",
            measurementId: "G-P66X9ZLEQ7"));
  } else {
    await Firebase.initializeApp();
  }
}
