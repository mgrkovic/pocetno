import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB1X_3VTdoda5wpABfZ-TDCIQ2vmIwaHWE",
            authDomain: "pocetno-e6d04.firebaseapp.com",
            projectId: "pocetno-e6d04",
            storageBucket: "pocetno-e6d04.appspot.com",
            messagingSenderId: "553856031241",
            appId: "1:553856031241:web:07580eb80fff0d0730b6d8",
            measurementId: "G-T0DXWTJXE8"));
  } else {
    await Firebase.initializeApp();
  }
}
