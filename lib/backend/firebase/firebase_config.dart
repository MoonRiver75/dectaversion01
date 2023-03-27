import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBphUpByKjH6_pNkBTNWgjLHOc-UVQC2Pk",
            authDomain: "auntenbase.firebaseapp.com",
            projectId: "auntenbase",
            storageBucket: "auntenbase.appspot.com",
            messagingSenderId: "357594340006",
            appId: "1:357594340006:web:300f4301a2d2126bd5f267",
            measurementId: "G-RZ200NQQMG"));
  } else {
    await Firebase.initializeApp();
  }
}
