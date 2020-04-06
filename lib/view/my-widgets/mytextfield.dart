import 'package:flutter/material.dart';
class myTextField extends TextField
{

  myTextField({@required TextEditingController controller ,
    TextInputType type:TextInputType.text ,
  String hint:"",
  Icon icon ,
  bool obscure:false}):super (
    controller: controller,
    keyboardType:type,
    obscureText :obscure,
    decoration :InputDecoration(
    hintText: hint,
    icon: icon
  )
  );
}