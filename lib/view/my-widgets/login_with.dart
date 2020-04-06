import 'package:flutter/material.dart';
import 'package:untitled8/util/alert_healper.dart';
import 'package:untitled8/util/fireHelper.dart';
class loginWith{

  Widget login_With_google(BuildContext context)
  {
    return Container(
        padding: EdgeInsets.all(20),
        child: Align(
            alignment: Alignment.center,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              onPressed: () {

                  fireHelper().handleSignInWithGoogle(context);

              },
              color: Colors.blueAccent,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      Icon(
                      Icons.account_circle,
                      color: Colors.white),
                  SizedBox(width: 10),
                  Text('Login with Google',
                  style: TextStyle(color: Colors.white))
              ],
            )
        )
    )
    )
    );
  }


}