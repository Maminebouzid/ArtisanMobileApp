import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/controleur/phone_verification.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'controleur/main_app.dart';
import 'controleur/main_log_controler.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Bienvenue ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.blue,
           primaryColor: Colors.blue,
          accentColor: white,
       ),
      home: _handleAuth(),
    );
  }
  Widget _handleAuth()
  {
    return StreamBuilder<FirebaseUser> (
      stream: FirebaseAuth.instance.onAuthStateChanged,
     builder: (BuildContext context , snapshot) {
        return (!snapshot.hasData)?  new loginControl() : new phoneVerification(snapshot.data.uid);
     },
    );
  }

}
