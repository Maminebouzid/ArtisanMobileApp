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

  TextEditingController  _phoneNumber;
  TextEditingController _smsCode;

    @override
  void initState() {
    // TODO: implement initState
      _phoneNumber= TextEditingController();
      _smsCode=TextEditingController();
    super.initState();
    //crrer une souscription au stream,
print("phone helo");
    stramListner=fireHelper().fire_User.document(widget.uid).snapshots().listen((document) {
setState(() {
  me=User(document);

 });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
print("phone gb");
     //arreter le stream
  stramListner.cancel();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center
      (
      child : (me==null)?loading(): Scaffold(

        appBar: (me?.phone==null)?AppBar(title: Text(VerificationNumeroAppBar),):null,
        body: (me?.phone==null)?verfier() :new maincontorler(me.uid) ,
      )
    );
  }
  FirebaseUser phoneuse;
Widget verfier()
{
return Column(
  children: <Widget>[
    Padding(padding: EdgeInsets.all(10.0),)    ,

    myTextField(controller: _phoneNumber, type: TextInputType.phone,icon: Icon(Icons.phone),hint: "met votre numero please use contry code",),
   RaisedButton( child: Text("Submit", style: TextStyle(fontSize: 15.0, color: Colors.white),),
     color: Color(0xFF18D191),
     elevation: 7.0,
   onPressed: () {
     if(_phoneNumber.text.length==13){
      registerPhone(_phoneNumber.text, context);
     }
     else
       {
         alertHealper().error(context, "format invalide ");
       }
   },)

/*
    Row(
      children: <Widget>[

      /*  Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: RaisedButton(
              onPressed: (){
                if( _phoneNumber.text.length ==9) {

                    phoneVerification(_phoneNumber.text,me.uid);
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
        ),*/
      ],
    )*/
  ],
);

}

String verificationcode;
  /*Future<void> phoneVerification(String phone,String uid) async{
 fireHelper().auth_instance.verifyPhoneNumber(phoneNumber: phone,
      timeout: Duration(seconds: 60),
     verificationCompleted: (AuthCredential auth) {

print("hola");
       setState(() {
       me.phone=phone;
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
                this._smsCode.text = value;
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
        smsCode: _smsCode.text,
      );
      final AuthResult myphoneuser = await fireHelper().auth_instance.signInWithCredential(credential);
      if(myphoneuser!=null)
        setState(() {
          print("ok");
          me.phone=_phoneNumber.text;
        });else{alertHealper().error(context, "merci de réessayer");
      }
     } catch (e) {
      alertHealper()..error(context, e);
    }
  }
*/
  Future registerPhone(String num ,BuildContext context)async{

    fireHelper().auth_instance.verifyPhoneNumber(phoneNumber: _phoneNumber.text,
        timeout:  const Duration(seconds: 60),
        verificationCompleted: ( credential){
          setState(() {
            me.phone=_phoneNumber.text;
            fireHelper().ModifyUser({KeyPhone:_phoneNumber.text});
          });

        },
        verificationFailed: (exception){
          alertHealper().error(context, exception.code);
        },
        codeSent: (id,[token])     {
          showDialog(context: context,
          barrierDismissible: false,
          builder: (context)=>AlertDialog(

            title: Text("enter sms code"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _smsCode,

                ),

              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Done"),
                textColor: Colors.white,
                color: Colors.redAccent,
                onPressed: (){

                  verificationcode= _smsCode.text.trim();
                  var _credential = PhoneAuthProvider.getCredential(verificationId: id, smsCode: verificationcode);
                 fireHelper().auth_instance.signInWithCredential(_credential).then((value) {
                   setState(() {
                     me.phone=_phoneNumber.text;
                     fireHelper().ModifyUser({KeyPhone:_phoneNumber.text});

                   });
                  Navigator.pop(context);
                 });
                 
                },
              )
            ],
          )
          );

        },
         codeAutoRetrievalTimeout:  (timeout){ });
  }
}