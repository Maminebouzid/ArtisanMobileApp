import 'package:flutter/material.dart';
import 'package:untitled8/util/fireHelper.dart';
import 'package:untitled8/view/my-widgets/Constane.dart';
import 'package:untitled8/view/my-widgets/myText.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled8/view/my-widgets/mytextfield.dart';
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
  Future<void> disconnect(BuildContext context) async
  {
    myText title =myText("voullez-vous deconnecter ?",color: Colors.black,);
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx ){
          return Theme.of(context).platform== TargetPlatform.iOS? CupertinoAlertDialog(title: title,
            actions: <Widget>[close(ctx, "non"),disconnectbtn(ctx)

            ],
          ):
          AlertDialog(title: title,
              actions: <Widget>[close(ctx, "non"),disconnectbtn(ctx)
              ]

          );

        }
    );

  }

  FlatButton disconnectbtn(BuildContext ctx)
  {
    return FlatButton(onPressed:(){

      Navigator.pop(ctx);
      Navigator.pop(ctx);
      fireHelper().logOut();
    },child: myText("oui",color: Colors.blue,),

    );
  }


Future<void> changeUserAlert(BuildContext context,{@required TextEditingController name,@required TextEditingController surname ,@required TextEditingController desc})async
{
      myTextField nameTF=myTextField(controller: name,hint: me.name,);
      myTextField surnameTF=myTextField(controller: surname,hint: me.surname,);
      myTextField descTF=myTextField(controller: desc,hint: me.description,);
        myText title= myText("Changer les Données de l'utilisateur",color: pointer,);
      return showDialog(context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx ){
            return Theme.of(context).platform== TargetPlatform.iOS? CupertinoAlertDialog(title: title,
              content: Column(children: <Widget>[
                   nameTF,
                surnameTF,
                descTF
              ],),
              actions: <Widget>[
                close(ctx, "Annuler"),
                FlatButton(child: myText("Valider",color: Colors.blue  ),
                  onPressed: (){ Map<String,dynamic>  data={} ;
                  if(name.text!="" && name.text!=null)
                    data[KeyName]=name.text;
                  if(surname.text!="" && surname.text!=null)
                    data[KeySurname]=surname.text;
                  if(desc.text!="" && desc.text!=null)
                    data[Keydescription]=desc.text;
                     fireHelper().ModifyUser(data);
                     Navigator.pop(context);
                  }
                  ,)
              ],
            ):
            AlertDialog(title: title,
                  content: Column(children: <Widget>[
                        nameTF,
                      surnameTF,
                      descTF
              ],),
                actions: <Widget>[
                  close(ctx, "Annuler"),
                  FlatButton(child: myText("Valider",color: Colors.blue,),
                    onPressed: (){ Map<String,dynamic>  data={} ;
                    if(name.text!="" && name.text!=null)
                      data[KeyName]=name.text;
                    if(surname.text!="" && surname.text!=null)
                      data[KeySurname]=surname.text;
                    if(desc.text!="" && desc.text!=null)
                      data[Keydescription]=desc.text;
                    fireHelper().ModifyUser(data);
                    Navigator.pop(context);
                    }
                    ,)

                ]

            );

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