import 'package:flutter/material.dart';
import 'package:untitled8/view/my-widgets/Constane.dart';
class BottomBar extends BottomAppBar
{
  BottomBar({@required List<Widget> items }):super(
    color:bottomColor,
    shape:CircularNotchedRectangle(),
    child:Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: items,
    )
  );
}