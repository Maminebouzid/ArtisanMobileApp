import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/controleur/main_app.dart';
import 'package:untitled8/util/alert_healper.dart';
import 'package:untitled8/util/fireHelper.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';

class  phoneVerification extends StatefulWidget
{
  String uid;
  phoneVerification(this.uid);
  @override
    createState()=> _mainPhoneVerification();



}
class _mainPhoneVerification extends State<phoneVerification>
{
  StreamSubscription stramListner;
  User user;
  String _phoneNumber;
  String _smsCode;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //crrer une souscription au stream,

    stramListner=fireHelper().fire_User.document(widget.uid).snapshots().listen((document) {
setState(() {
  user=User(document);
  print(user.phone);
});
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


     //arreter le stream
  stramListner.cancel();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center
      (
      child : (user==null)?loading(): Scaffold(

        appBar: AppBar(title: Text((user.phone==null)?VerificationNumeroAppBar:AccueilAppBAr),),
        body: (user.phone==null)?verfier() :new maincontorler(user.uid) ,
      ));
  }
  FirebaseUser phoneuse;
Widget verfier()
{
return Column(
  children: <Widget>[
    Padding(padding: EdgeInsets.all(10.0),)    ,
      ListTile(
      leading: Icon(Icons.phone),
      title: TextFormField(
        decoration: InputDecoration(
            labelText: "Phone Number"
        ),
        keyboardType: TextInputType.phone,
        maxLength: 13,
      initialValue: "+213",
        onChanged: (value) => { _phoneNumber = value},
      ),
    ),
    Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: RaisedButton(
              onPressed: (){
                if(_phoneNumber.contains("+213") && _phoneNumber.length==13) {

                    phoneVerification(_phoneNumber,user.uid);
              }
              else{
                alertHealper().error(context, "merci d avoir mettre un numero valide");
              }
              },

              child: Text("Submit", style: TextStyle(fontSize: 15.0, color: Colors.white),),
              color: Color(0xFF18D191),
              elevation: 7.0,
            ),
          ),
        ),
      ],
    )
  ],
);

}

String verificationID;
  Future<void> phoneVerification(String phone,String uid) async{
 fireHelper().auth_instance.verifyPhoneNumber(phoneNumber: phone,
      timeout: Duration(seconds: 10),
     verificationCompleted: (AuthCredential auth) {

print("hola");
       setState(() {
       user.phone=phone;
     });
fireHelper().setPhone(uid, {KeyPhone:phone});
     },
     verificationFailed: (AuthException exc){ alertHealper().error(context, exc.message);},
     codeSent: (String verificationId,[code]){
   print("not ok");
       smsCodeDialog(context);
     },
     codeAutoRetrievalTimeout: (String code){
verificationID=code;
//smsCodeDialog(context);
     });
  }
   Future<bool> smsCodeDialog(BuildContext context)
{
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter Code"),
            content: TextField(
              onChanged: (value) {
                this._smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                child: Text("Verifier"),
                onPressed: (){

                  signIn();
                  }
                  ),
            ]
          ) ;},
              );



}

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationID,
        smsCode: _smsCode,
      );
      final AuthResult myphoneuser = await fireHelper().auth_instance.signInWithCredential(credential);
      if(myphoneuser!=null)
        setState(() {
          print("ok");
          user.phone=_phoneNumber;
        });else{alertHealper().error(context, "merci de réessayer");
      }
     } catch (e) {
      alertHealper()..error(context, e);
    }
  }


}