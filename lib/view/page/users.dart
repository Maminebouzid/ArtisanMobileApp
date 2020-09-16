import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/util/fireHelper.dart';
import 'package:untitled8/view/my-widgets/user_tile.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';
class userpage extends StatefulWidget
{
   _userpageState createState() => _userpageState();

}
class  _userpageState extends State<userpage>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<QuerySnapshot>(
      stream: fireHelper().fire_artist.snapshots(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
if(snapshot.hasData)
{
  List<DocumentSnapshot> document=snapshot.data.documents;
return  NestedScrollView(
  headerSliverBuilder: (BuildContext  build,bool scrolled){

return   [  SliverAppBar(
  pinned: true,
  flexibleSpace:FlexibleSpaceBar(
      title: myText("Liste d'Artisant",color: pointer,),
    background: Image(image: eventImage,fit: BoxFit.cover,),
  ) ,

  expandedHeight:100 ,

),]
  ;
  },
  body: ListView.builder(
  itemCount: document.length,
      itemBuilder: (BuildContext ctx ,int index)
      {//change it to artisan
        User user =User(document[index]);
        return  UserTile(user);
      }
  ),
);
}else{
  return loading_center();
}
      },
    );
  }

}