import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasexample/api/firebase_api.dart';
import 'package:firebasexample/api/firebase_options.dart';
import 'package:firebasexample/screen/auth.dart';
import 'package:firebasexample/screen/home.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ilk flutterı sonra firebase'i ayağa kaldır diyoruz..
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(MaterialApp(
    home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          }
          return const Auth();
        }),
  ));
}
  
// Stream Builder : Asenkron işlemleri dinlememizi ve build etmesini sağlayan widget