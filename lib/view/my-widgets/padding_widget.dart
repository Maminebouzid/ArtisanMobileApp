import 'package:flutter/material.dart';
class paddingwith extends Padding
{
  paddingwith({
  @required widget :Widget,
  double top:10.0,
   double left :0.0,
double right :0.0,
  double bottom:0.0


}):  super(
    padding:EdgeInsets.only(top: top,
    left: left,
    right: right,
    bottom: bottom
    ),
    child: widget,
  );


}