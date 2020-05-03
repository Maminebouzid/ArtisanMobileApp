import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled8/util/alert_healper.dart';
import 'package:untitled8/util/fireHelper.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';
import 'package:untitled8/view/page/Accueilpage.dart';
import 'package:untitled8/view/page/newPost.dart';
import 'package:untitled8/view/page/notification.dart';
import 'package:untitled8/view/page/profile.dart';
import 'package:untitled8/view/page/users.dart';


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
   int index=0;
/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     //crrer une souscription au stream,
print("hl");
    stramListner=fireHelper().fire_User.document(widget.uid).snapshots().listen((document) {
setState(() {
  //sinon me;
  me=User(document);
 });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //arreter le stream
    print("gb");
  stramListner.cancel();
  }*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center
      (
      child : (me==null)?loading():
          SafeArea(child: Scaffold(
            key: _globalKey,
              backgroundColor: white,
              endDrawer: Menu_App_Bar(),
            bottomNavigationBar: BottomBar(items: <Widget>[
              BarItems(icon: homeIcon,onPressed: (()=>(buttonSelected(0))),selected: index==0,),
              BarItems(icon: freindsIcon,onPressed: (()=>buttonSelected(1)),selected: index==1,),
              Container(width: 0.0,height: 0.0,),// pour le design pour le bouton de centre
              BarItems(icon: notificationIcon,onPressed: (()=>buttonSelected(2)),selected: index==2,),
              BarItems(icon: Icon(Icons.menu),onPressed: (()=>_globalKey.currentState.openEndDrawer()),selected: index==3,)

            ],

            ),

            body:  showPage(),
            floatingActionButton: FloatingActionButton(onPressed: write,child: WriteICon , ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          ),)



    );
  }
  write(){
_globalKey.currentState.showBottomSheet((context) => NewPost());
  }
buttonSelected(int index)
{

  setState(() {
    this.index=index;

  });



}
Widget showPage(){
    switch (index)
    {
      case 0 : return FilActualiter();break;
      case 1 : return userpage() ; break;
      case 2 : return notificationPage(); break;

      case 4: return Profilepage (me);break;
      default : return userpage(); break;
    }
}

Widget Menu_App_Bar() {
  return Drawer(
    child:ListView(
      children: <Widget>[
        _createHeader(),
          ListTile(onTap:(){buttonSelected(4) ;
          Navigator.of(context).pop();}
          ,selected: index==4,title:   Text("Profile",style: TextStyle(fontSize: 20),),  )
         ,
        ListTile(onTap: (){  alertHealper().disconnect(context);  },title:   Text("Deconnecté",style: TextStyle(fontSize: 20),),selected: index==4,)
            ],
    ),
  );
}

Widget _createHeader()
{
  return UserAccountsDrawerHeader(

    accountName: Text(me.name+"  " + me.surname),

    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.blue,
      child: Text(
        me.name[0],
        style: TextStyle(fontSize: 40.0),
      ),
    ),

  );

}
}