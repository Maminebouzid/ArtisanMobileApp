import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled8/controleur/main_app.dart';
import 'package:untitled8/util/alert_healper.dart';
import 'package:untitled8/view/my-widgets/Constane.dart';

class fireHelper {
  //auth with password and email
  final auth_instance =FirebaseAuth.instance;
  Future<FirebaseUser> SignIn (String mail , String pwd,BuildContext context) async
  {
try {
  final AuthResult user = await auth_instance.signInWithEmailAndPassword(
      email: mail, password: pwd);
  return user.user;
}on Exception catch(_)
    {
      alertHealper().error(context, MessagePasDeConnexion);
    }
  }
  Future<FirebaseUser> createAccount(String mail, String pwd, String name ,String surname,BuildContext context) async
  {
    try {
      final AuthResult user = await auth_instance
          .createUserWithEmailAndPassword(email: mail, password: pwd);
      //crrer user pour ajouter db
      String uid = user.user.uid;
      List <dynamic> followers = [];
      List <dynamic> following = [uid];
      Map<String, dynamic> map = {
        KeyName: name,
        KeySurname: surname,
        KeyImageUrl: "",
        KeyFollowers: followers,
        KeyFollowing: following,
        KeyUid: uid
      };
      addUser(uid, map);
      return user.user;
    }on Exception catch(_)
    {
        alertHealper().error(context, MessagePasDeConnexion);
     }
  }

  logOut()=>auth_instance.signOut();


  // auth with google account
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> handleSignInWithGoogle(BuildContext context) async {


    // hold the instance of the authenticated user
     FirebaseUser user;
    // flag to check whether we're signed in already
    bool isSignedIn = await _googleSignIn.isSignedIn();

    if (isSignedIn) {
      // if so, return the current user
      user = await auth_instance.currentUser();
    }
    else {/*
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,

      );

    */
      ///the new code
      try {
        GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
        GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: gSA.accessToken,
          idToken: gSA.idToken,
        );
        AuthResult authResult = await auth_instance.signInWithCredential(credential);
        if (authResult.additionalUserInfo.isNewUser) {
          //User logging in for the first time
          // Redirect user to tutorial

          user = (await auth_instance.signInWithCredential(credential)).user;

          List <dynamic> followers = [];
          List <dynamic> following = [user.uid];
          var temp = user.displayName.split(" ");
          String surname = temp[temp.length - 1];
          String name = "";
          for (int i = 0; i < temp.length - 1; i++) {
            name = name + " " + temp[i];
          }
          Map<String, dynamic> map = {
            KeyName: name,
            KeyPhone: user.phoneNumber,
            KeySurname: surname,
            KeyImageUrl: "",
            KeyFollowers: followers,
            KeyFollowing: following,
            KeyUid: user.uid
          };
          addUser(user.uid, map);
          return user;
        }
        else {
          //User has already logged in before.
          //Show user profile
    return      user= authResult.user;
        }
      } catch (e) {
        print(e.message);
      }}


  }




  //database
static final data_instance=Firestore.instance;
final fire_User=data_instance.collection("user");
addUser(String uid,Map<String ,dynamic> map)
{
  fire_User.document(uid).setData(map);
}
setPhone(String uid,Map<String ,dynamic> map)
{
  final fire_user=data_instance.collection("user");
  fire_user.document(uid).updateData(map);

}


  //storage
}
