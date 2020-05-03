import 'package:flutter/material.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/models/user.dart';
class FilActualiter extends StatefulWidget
{
   _FileActualiterState createState() => _FileActualiterState();

}
class  _FileActualiterState extends State<FilActualiter>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: myText("fil f actualité ",color: Colors.blue,),);
  }

}