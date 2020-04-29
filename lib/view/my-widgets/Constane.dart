import 'package:flutter/material.dart';
import 'package:untitled8/models/user.dart';
//User Global
User me;

//colors
const Color white= const Color(0xFFFFFFFF);
const Color base =const Color(0xFFEEEEEE);
const Color baseAccent =const Color(0xFF616161);
const Color pointer=const Color(0xFFF44336);
const Color bottomColor=const Color(0xFF26C6DA);

//image
AssetImage logoImage= AssetImage("IMAGE/food.png");
AssetImage eventImage= AssetImage("IMAGE/event.jpg");
AssetImage homeimage=AssetImage("IMAGE/home.jpg");

//Icon
Icon homeIcon=Icon(Icons.home);
Icon freindsIcon=Icon(Icons.group) ;
Icon notificationIcon=Icon(Icons.notifications);
Icon profileIcon=Icon(Icons.account_circle) ;
Icon WriteICon=Icon(Icons.border_color);
Icon sendIcon=Icon(Icons.send);
Icon camIcon=Icon(Icons.camera_enhance);
Icon liberaIcon=Icon(Icons.photo_library);
Icon likeEmptey=Icon(Icons.favorite_border);
Icon LikeFull=Icon(Icons.favorite);
Icon MsgIcon = Icon(Icons.message);
Icon deconnecter=Icon(Icons.settings);
//keys
String KeyName="name"  ;
String KeyPhone ="phone_number";
String KeySurname= "surname";
String KeyImageUrl="imageUrl";
String KeyFollowers="followers";
String KeyFollowing="following";
String KeyUid="uid";
String Keydescription="description";
//postkey
String KeyPostId="postID";
String Keytext="text";
String keyComments="comments";
String KeyDate="date";
String KeyLikes="Likes";
String KeyCommentaire="comment";

//AlertMessage
String MessagePasDeConnexion="verifier votre connexion";
String MessageMotDePasseCourt ="mot de passe tres court (minimum 6 caractere)";
String MessagePasDeNom="Aucun nom ";
String MessagePasDePrenom="Aucun prénom ";
String MessagePasMotDePasse="Aucun mot de passe";
String MessagePasDEmail="Aucune adresse email";


//AppBarMessage
String VerificationNumeroAppBar="verfication numero de telephone";

//message par defaut post
String MessageParDefautPost="Ecrivez quelque chose";


