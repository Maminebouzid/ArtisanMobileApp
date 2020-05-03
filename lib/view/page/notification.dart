import 'package:flutter/material.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';
class notificationPage extends StatefulWidget
{
   _notificationState createState() => _notificationState();

}
class  _notificationState extends State<notificationPage>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: myText("notification ",color: Colors.blue,),);
  }

}