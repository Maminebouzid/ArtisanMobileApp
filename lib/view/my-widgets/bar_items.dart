import 'package:flutter/material.dart';
import 'Constane.dart';
class BarItems extends IconButton
{
BarItems({@required Icon icon , @required VoidCallback onPressed,@required bool selected}):super(
  icon :icon,
  onPressed:onPressed,
  color:selected? pointer:white
);
}