import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:untitled8/util/alert_healper.dart';
import 'package:untitled8/util/fireHelper.dart';

class loginControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _logstat();
  }


}

class _logstat extends State {
PageController _pageController;
TextEditingController _mail;
TextEditingController _pwd;
TextEditingController _name;
TextEditingController _surname;
@override
  void initState() {
    // TODO: implement initState

  super.initState();
  _pageController=PageController() ;
  _mail=TextEditingController();
  _pwd=TextEditingController();
  _name=TextEditingController();
  _surname=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
    _surname.dispose();
    _name.dispose();
    _pwd.dispose();
    _mail.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          //notification received
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child:InkWell(
            child:  Container(
                height: (MediaQuery.of(context) .size.height >= 650) ? MediaQuery.of(context) .size .height : 650,
                width: MediaQuery.of(context) .size.width,
                // decoration: mygradient(startcoleur: base, endcoleur: baseAccent),

                child: SafeArea(
                  child: Column(

                    children: <Widget>[
                      paddingwith(widget: Image(image: logoImage,height: 100),),

                      paddingwith(widget: menu2item(item1: "Connexion", item2: "Création",pageController: _pageController),top: 20,bottom: 20.0, ),
                      Expanded(flex: 2,
                          child: PageView(
                            controller: _pageController,
                            children: <Widget>[
                              logView(0)    ,
                              logView(1)

                            ],
                          )
                      )
                    ],
                  ),
                )

            ),
            //pour enter le clavier
            onTap:(() => hideKeyBoeard()) ),

        ),
      ),
    );
  }






  Widget logView(int index)
  {
    return  Column(
      children: <Widget>[
        paddingwith(
          widget: Card(
          elevation: 7.5,
          color: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),


          )
            ,
            child:Container(
                margin: EdgeInsets.all(20.0),
    child:  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  listItems(index ==0 ,context),

    ),
            )


            ),
          top: 15,bottom: 15,left: 20,right: 20,),
        paddingwith(
          top: 15.0,bottom: 15.0,
          widget: bottonGradient(CallBack: (()=> (Signin(index==0))), text: (index ==0 )? "Se Connecter":"Créer un compte")


        ),
        paddingwith(widget: FlatButton(
          child: Text("Mot de passe oublié ?",style: TextStyle(color: bottomColor),),
      onPressed: (){ alertHealper().error(context, "hhhhh");},
        ),)
      ],
    );
  }

List <Widget> listItems (bool exist,BuildContext context)
{
  List<Widget> list =[];
  if(!exist){

list.add( myTextField(controller:  _surname ,hint:"Entrez votre prénom" ,) );
    list.add( myTextField(controller:  _name ,hint:"Entrez votre nom" ,) );


  }else{
    list.add( loginWith().login_With_google(context));
    list.add(paddingwith(widget: Text("-------- OU --------"),bottom: 12,)) ;
  }
    list.add(myTextField(controller:_mail ,hint: "Entrez votre edresse mail ",type: TextInputType.emailAddress,));
    list.add(myTextField(controller: _pwd,hint: "Entrez votre mot de passe",obscure: true,));
return list;
}
Signin(bool exist){
if(_mail.text!=null&&_mail.text!="")
  { if(_pwd.text!="" && _pwd.text!=null && _pwd.text.length>=6)
    { if(exist){
     //connexion

        fireHelper().SignIn(_mail.text, _pwd.text,context);
        fireHelper().SignIn(_mail.text, _pwd.text,context);
    }else{
      //verifier nom prenom puis conxion
    if(_name.text!=null&&_name.text!="")
      {
        if(_surname.text!=null&&_surname.text!="")
          {//inscription

              fireHelper().createAccount(
                  _mail.text, _pwd.text, _name.text, _surname.text,context);

          }else{
          //pas de prenom
          alertHealper().error(context,MessagePasDePrenom);

        }

      }else { //alert pas de nom
      alertHealper().error(context,MessagePasDeNom);
    }
    }

    }else{
    //aler pwd
    if(_pwd.text.length<6)
      alertHealper().error(context, MessageMotDePasseCourt);
      else{
        print(_pwd.text.length<6);
    alertHealper().error(context, MessagePasMotDePasse);}
  }

  }else{//alert mail
alertHealper().error(context,MessagePasDEmail);
}
}
hideKeyBoeard() {
  FocusScope.of(context).requestFocus(FocusNode());

}
 }