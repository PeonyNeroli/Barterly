import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC_FSAXDHH2jB5qXVGts1iJ_zhcc7yex74",
            authDomain: "entri-education-app.firebaseapp.com",
            projectId: "entri-education-app",
            storageBucket: "entri-education-app.appspot.com",
            messagingSenderId: "1035095167126",
            appId: "1:1035095167126:web:ea11be6e7a6de85c9132b7",
            measurementId: "G-C6SBRZPY0Z"));
  } else {
    await Firebase.initializeApp();
  }
}
