import 'dart:math';
import 'package:untitled8/view/mymaterial.dart';
import 'package:flutter/material.dart';
class mypainter extends CustomPainter
{
    Paint painter ;
  final PageController  pageController;
mypainter(this.pageController):super(repaint :
pageController){
  painter= Paint()
      ..color=Colors.white
      ..style=PaintingStyle.fill;

}
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
if(pageController!=null &&pageController.page!=null)
  {
final radius=20.0;
final dy=25.0;
final   dxcurront=25.0;
final dxtarget=125.0;
final maposition=pageController.position;
final extent =(maposition.maxScrollExtent - maposition.minScrollExtent+maposition.viewportDimension);
final offset=maposition.extentBefore/extent;
bool toRight =dxcurront<dxtarget;
Offset entry=Offset(toRight ?dxcurront:dxtarget, dy);
Offset target =Offset(toRight? dxtarget:dxcurront,dy);
Path path=Path();
path.addArc(Rect.fromCircle(center: entry,radius: radius), 0.5*pi, 1*pi);
path.addRect(Rect.fromLTRB(entry.dx, dy-radius,target.dx, dy+radius));
path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5*pi, 1*pi); 
canvas.translate(size.width*offset, 0.0);
canvas.drawShadow(path, base, 7.5, true);
canvas.drawPath(path, painter);

  }
  }

  @override
  bool shouldRepaint(mypainter oldDelegate) =>true;

}