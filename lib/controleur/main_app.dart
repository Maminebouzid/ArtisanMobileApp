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
  GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
  StreamSubscription stramListner;
  User user;
  int index=0;
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
      child : (user==null && user.phone!=null)?loading():
          SafeArea(child: Scaffold(key: _globalKey,

            bottomNavigationBar: BottomBar(items: <Widget>[
              BarItems(icon: homeIcon,onPressed: (()=>(buttonSelected(0))),selected: index==0,),
              BarItems(icon: freindsIcon,onPressed: (()=>buttonSelected(1)),selected: index==1,),
              Container(width: 0.0,height: 0.0,),// pour le design pour le bouton de centre
              BarItems(icon: freindsIcon,onPressed: (()=>buttonSelected(2)),selected: index==2,),
              BarItems(icon: profileIcon,onPressed: (()=>buttonSelected(3)),selected: index==3,)
            ],),
            body: Center(child: Text(user.name),),
            floatingActionButton: FloatingActionButton(onPressed: write,child: WriteICon , ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          ),)



    );
  }
  write(){

  }
buttonSelected(int index)
{
  setState(() {
    this.index=index;
  });
}
}