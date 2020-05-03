import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:untitled8/util/fireHelper.dart';
class NewPost extends StatefulWidget

{
  _NewPostStat createState() => _NewPostStat();

}
class _NewPostStat extends State<NewPost>
{

  TextEditingController _controller;
  File ImageTaken;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // TODO: implement initState
    super.initState();
    _controller=new TextEditingController();
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([ DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,]);
    // TODO: implement dispose
    super.dispose();
   _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SingleChildScrollView( child:SafeArea(child:
      new Container(

      color: white,
      height: MediaQuery.of(context).size.height*0.6,
    child: Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0)
        )
      ),
      child: InkWell(onTap:() =>FocusScope.of(context).requestFocus(FocusNode()),

         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          paddingwith(widget: myText(MessageParDefautPost,color: baseAccent,fontsize: 30.0,),top: 30.0,),
          paddingwith(widget: Container(width: MediaQuery.of(context).size.width, height: 1.0,color: baseAccent,),   ),
          paddingwith(widget: myTextField(controller: _controller , hint: "Exprimez-vous",icon: WriteICon,), top: 25,right: 25,left: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: <Widget>[
              IconButton(icon: camIcon, onPressed: ( ()=> takepicture(ImageSource.camera)),),
                  IconButton(icon: liberaIcon, onPressed: ( ()=> takepicture(ImageSource.gallery)),)

                ],
                ),
                Container(
                  width: 75.0,
                  height: 75.0,
                   child:  (ImageTaken==null) ? myText("Aucune Image",fontsize: 13.0,color: Colors.black,):Image.file(ImageTaken)                )
              ],

            ),
            bottonGradient(CallBack: sendToFireBase, text: "Envoyer"),
           //  SumbitBotton(() {sendToFireBase();})
          ],
       ),
      ),
    ),
    ),
    )
      ,);
  }
  Future<void> takepicture(ImageSource source) async{
File image= await ImagePicker.pickImage(source: source,maxWidth: 500,maxHeight: 500);
setState(() {
  ImageTaken= image;
});
  }
sendToFireBase(){

    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pop(context);
if(ImageTaken !=null ||(_controller.text!=null && _controller.text!=""))
 {
    fireHelper().addPost(me.uid, _controller.text, ImageTaken);
 }
}
Widget SumbitBotton(VoidCallback callback)
{
  return FloatingActionButton(
    onPressed: callback,
    tooltip: "Envoyer",
    child: Icon(Icons.send),
  );
}

}