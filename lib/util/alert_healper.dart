import 'package:flutter/material.dart';
import 'package:untitled8/view/my-widgets/Constane.dart';
import 'package:untitled8/view/my-widgets/myText.dart';
import 'package:flutter/cupertino.dart';
class alertHealper {

  Future<void> error(BuildContext context , String error) async{
myText title = myText("Erreur",color: Colors.black,);
myText subtute= myText(error, color: Colors.black);
return showDialog(context: context,
    barrierDismissible: true,
    builder:    (BuildContext ctx){

return( Theme.of(context).platform== TargetPlatform.iOS )
    ? CupertinoAlertDialog(title: title , content: subtute,actions: <Widget>[  close(ctx, "ok")],)
    :AlertDialog(title: title,content: subtute,actions: <Widget>[close(ctx, "ok")],);



}
);


  }
FlatButton close(BuildContext ctx,String text)
{
return FlatButton(
  onPressed: (()=>{
    Navigator.pop(ctx)
  } ),
  child: myText(text ,color:pointer),
);
}
}