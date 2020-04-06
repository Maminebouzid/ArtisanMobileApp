import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled8/util/fireHelper.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';
class  maincontorler extends StatefulWidget
{
  String uid;
  maincontorler(this.uid);
  @override
    createState()=> _mainContoller();



}
class _mainContoller extends State<maincontorler>
{
  StreamSubscription stramListner;
  User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     //crrer une souscription au stream,

    stramListner=fireHelper().fire_User.document(widget.uid).snapshots().listen((document) {
setState(() {
  user=User(document);
  print(user.name);
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
      child : (user==null)?loading():Scaffold(body: Center(child: Text(user.name),),),
    );
  }

}