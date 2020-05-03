 import 'package:untitled8/view/my-widgets/Constane.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
class Post{

  DocumentReference ref;
  String documentId ;
  String id ;
  String Text;
  String userID;
  String imageUrl;
  int date;
  List<dynamic> Likes;
  List<dynamic> Commentaire;


  Post( DocumentSnapshot snapshot, ){
    ref=snapshot.reference;
    documentId=snapshot.documentID;
     Map<String,dynamic> map=snapshot.data;
    id=map[KeyPostId];
    Text=map[Keytext];
    userID=map[KeyUid];
    imageUrl=map[KeyImageUrl];
    date=map[KeyDate];
    Likes=map[KeyLikes];
    Commentaire=map[KeyCommentaire];

  }
Map<String,dynamic> toMap(){
    Map<String,dynamic> map ={
      KeyPostId:id,
      KeyUid:userID,
      KeyDate:date,
      KeyLikes:Likes,
      KeyCommentaire:Commentaire


    };
    if(Text!=null) map[Keytext]=Text;
    if(imageUrl!=null) map[KeyImageUrl]=imageUrl;
    return map;
  }
}