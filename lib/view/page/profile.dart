import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/models/Post.dart';
import 'package:untitled8/util/alert_healper.dart';
import 'package:untitled8/util/fireHelper.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';
import 'package:untitled8/delegate/hearder_delegate.dart';
import 'package:untitled8/view/tiles/posttiles.dart';
import 'package:image_picker/image_picker.dart';
class Profilepage extends StatefulWidget
{
 final User user;
  Profilepage(this.user);
   _ProfileState createState() => _ProfileState();

}
class  _ProfileState extends State<Profilepage>
{
  TextEditingController _name;
  TextEditingController _surname;
  TextEditingController _desc;
    bool _isMe=false;
  ScrollController controller;
  double expended=200.0;
  bool get  _showTitle {

    return controller.hasClients &&controller.offset>expended - kToolbarHeight;
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isMe=(widget.user.uid==me.uid);
controller=ScrollController()..addListener(() {
  setState(() {

  });
});
_name=TextEditingController();
_surname=TextEditingController()
    ;_desc=TextEditingController();
}
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    _name.dispose();
    _surname.dispose();
    _desc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  StreamBuilder<QuerySnapshot> (
       stream: fireHelper().postFrom(widget.user.uid),
      builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot ){
        if(!snapshot.hasData)
          {
            return loading_center();
          }else{
          List<DocumentSnapshot> documents=snapshot.data.documents;
        return  CustomScrollView(
          controller: controller,
    slivers: <Widget>[
            SliverAppBar(

              pinned: true,
              expandedHeight: expended,
              actions: <Widget>[Container(),//to hide end drawer
                (_isMe)? myText(""):myText("to foolow function"),


              ],
              flexibleSpace: FlexibleSpaceBar(
                title:  _showTitle? Text(widget.user.name + "   "+ widget.user.surname):myText(""),
                background: Container(
                  decoration: BoxDecoration(image: DecorationImage(image: logoImage,fit: BoxFit.cover), ),
                    child:Center(child: profile_image(url: widget.user.imageUrl,onpressed: changeUser,size: 75.0,),),
                )
              ),
            ),
            SliverPersistentHeader(pinned: true,
            delegate: myHeader(user: widget.user,callback: changeFields,scrolled: _showTitle),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,index){
              if(index== documents.length)
                  return ListTile ( title: myText("Fin  de Liste"),);
                if(index> documents.length)
                  return null;
              Post post= Post(documents[index]);
                return postTile( post:post,user: widget.user,);

            } ),
            )
    ],
        );
        }


      },
    );
  }
  void changeFields()
  {
    alertHealper().changeUserAlert(context, name: _name   , surname: _surname, desc: _desc);
  }
  void changeUser()
  {
    showModalBottomSheet(context: context,   builder: (BuildContext ctx){
      return Container(color: Colors.transparent,
      child: Card(elevation: 5.0,
      margin: EdgeInsets.all(7.5),
      child: Container (color: base,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          myText("Modification de la photo de profil",color: Colors.black,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: camIcon,onPressed: (){TakePicture(ImageSource.camera);
            Navigator.pop(ctx);}),
            IconButton(icon: liberaIcon,onPressed: (){TakePicture(ImageSource.gallery);Navigator.pop(ctx);})


          ],)

        ],
      )
        ,),)
        ,);
    });
  }
  Future<void>TakePicture(ImageSource source)async
  {
    File file=await ImagePicker.pickImage(source: source, maxHeight: 500.0,maxWidth: 500.0);
    fireHelper().ModifyPicture(file);
  }
validate()
{

}
}
// bottonGradient(CallBack: validate,text: "Valider les changements",)
/*myTextField(controller:_name ,hint: widget.user.name,),
          myTextField(controller:_surname ,hint: widget.user.surname,),
          myTextField(controller:_desc ,hint: widget.user.description??"Aucune Description"          ,),*/