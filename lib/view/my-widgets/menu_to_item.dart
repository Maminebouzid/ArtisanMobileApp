import 'package:untitled8/view/my-widgets/Constane.dart';
import 'package:untitled8/view/my-widgets/painter.dart';
import 'package:flutter/material.dart';
class menu2item extends StatelessWidget
{
  final String item1 ,item2;
  final PageController pageController;
menu2item({
    @required String this.item1 ,
    @required String this.item2,
    @required PageController  this.pageController}    );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(color: baseAccent,
      borderRadius: BorderRadius.all(Radius.circular(25.0))

      ),
      child: CustomPaint(
      painter: mypainter(pageController),
      child:    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          itemBouton(item1),
          itemBouton(item2)
        ],

      )
        ,
      )



    );
  }
Expanded itemBouton(String name)
{
return Expanded(child: FlatButton(onPressed: (){
  int page=(pageController.page==0.0) ? 1 :0;
      pageController.animateToPage( page,
      duration: Duration(microseconds: 500),
      curve: Curves.decelerate);
}
    , child: Text(name,style: TextStyle(color: Colors.red),)),
);
}

}