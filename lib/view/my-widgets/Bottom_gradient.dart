import 'package:flutter/material.dart';
 import 'package:untitled8/view/mymaterial.dart';
class bottonGradient extends Card
{

  bottonGradient({double elevation:7.5,@required VoidCallback CallBack ,
  double width:300,double heigh :50,
    @required String text
  }):super(

      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(heigh/2)),

      child: Container(
        width: width,
        height: heigh,
        child: FlatButton(
          child: myText(  text  ),
          onPressed:  CallBack
        ),
        decoration: mygradient( startcoleur: baseAccent,endcoleur: base,radius: heigh/2,
            ishorizontal: true        ),


      )
      ,

  );

}