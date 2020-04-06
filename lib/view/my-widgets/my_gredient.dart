import 'package:flutter/material.dart';
class mygradient extends BoxDecoration
{
 static final FractionalOffset begin=FractionalOffset(0.0 ,0.0);
static final FractionalOffset endhorizontal = FractionalOffset(1.0, 0.0 );
  static final FractionalOffset endvertical = FractionalOffset(0.0, 1.0 );

  mygradient({@required Color startcoleur , @required Color endcoleur ,bool ishorizontal :false ,double radius :0.0})
:super(
  gradient :LinearGradient(
colors: [startcoleur,endcoleur],
    begin: begin,
end: (ishorizontal) ? endhorizontal:endvertical,
tileMode: TileMode.clamp,
  ),
  borderRadius: BorderRadius.all(Radius.circular(radius)),

);


}