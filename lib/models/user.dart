import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled8/models/Personne.dart';
import 'package:untitled8/view/my-widgets/Constane.dart';
class User extends Personne
{

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

}