import 'package:flutter/material.dart';
class myText extends Text
{
  myText(data ,{
    TextAlign algnement :TextAlign.center,
    double fontsize:17.0,
    FontStyle style :FontStyle.normal,
    color:Colors.white

  }) : super(data,
 textAlign:algnement,
  style: TextStyle(   fontStyle: style ,
      color: color,
    fontSize: fontsize
   )

  );


}