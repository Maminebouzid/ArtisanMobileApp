import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled8/view/my-widgets/Constane.dart';
class User
{
  String uid,name,surname,imageUrl,phone;
  List<dynamic> followers;
  List<dynamic> following;
  DocumentReference ref;
  String documentId;
  String description;

  User(DocumentSnapshot snapshot)
  {
    ref=snapshot.reference;
    documentId=snapshot.documentID;
     Map<String,dynamic> map=snapshot.data;
     uid=map[KeyUid];
     name=map[KeyName];
     surname=map[KeySurname];
     followers=map[KeyFollowers];
     following=map[KeyFollowing];
     imageUrl=map[KeyImageUrl];
      phone=map[KeyPhone];
    description=map[Keydescription];
  }
Map<String,dynamic> toMap()
{
return {
  KeyUid:uid,
  KeyName:  name,
  KeySurname:surname,
  KeyImageUrl:"",
  KeyFollowers:followers,
  KeyFollowing: following,
  KeyPhone:phone,
  Keydescription:description
};
}
}