import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/models/user.dart';
import 'package:untitled8/util/alert_healper.dart';
import 'package:untitled8/view/mymaterial.dart';

class myHeader extends SliverPersistentHeaderDelegate{
User user;
VoidCallback callback;
bool scrolled ;
 myHeader({@required this.user,@required this.callback, @required  this.scrolled});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      return Container(
        margin: EdgeInsets.only(bottom: 5.0),
        padding: EdgeInsets.all(10.0),
        color: baseAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            (scrolled)?Container(width: 0.0,height: 0.0,):element( "${user.name} ${user.surname}"),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              profile_image(url: user.imageUrl,onpressed: null,),
              element((user.description==null)?"Aucune Description": user.description),


            ],
            ),
            Container(width: MediaQuery.of(context).size.width,height: 2.0,color: base,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                InkWell(child: myText("followers : ${user.followers.length}")),
                  InkWell(child: myText("following : ${user.following.length-1}"))

              ],
                )
              ],
            ),
      );


    }
Widget element(String text)
{ //c est moi !!
  if(user.uid==me.uid)
    {
      return InkWell(
        child: myText(text),
        onTap: callback,
      );
    }// un autre user
    else
      {
      return myText(text);
      }
}
  @override
  // TODO: implement maxExtent
  double get maxExtent => (scrolled)?150.0:200.0;

  @override
   double get minExtent => (scrolled)?150.0:200.0;

  @override
  bool shouldRebuild(myHeader oldDelegate) => scrolled != oldDelegate.scrolled || user != oldDelegate.user;
}