import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled8/view/my-widgets/Constane.dart';
import 'package:untitled8/view/mymaterial.dart';
class profile_image extends InkWell
{
  profile_image({double size :20.0, @required String url ,@required VoidCallback onpressed}):super(
    onTap:onpressed,
    child:CircleAvatar(
      radius: size,
      backgroundImage: (url!=null&& url!="") ? CachedNetworkImageProvider(url): eventImage,
      backgroundColor: white,
    )
  );


}