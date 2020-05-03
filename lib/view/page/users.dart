import 'package:flutter/material.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';
class userpage extends StatefulWidget
{
   _userpageState createState() => _userpageState();

}
class  _userpageState extends State<userpage>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: myText("users ",color: Colors.blue,),);
  }

}