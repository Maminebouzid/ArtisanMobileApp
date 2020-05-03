import 'package:flutter/material.dart';
import 'package:untitled8/models/Post.dart';
import 'package:untitled8/models/user.dart';
import 'package:untitled8/view/mymaterial.dart';
import 'package:cached_network_image/cached_network_image.dart';
class postTile extends StatelessWidget
{
  final Post post;
  final User user;
  final bool detail;
  postTile({@required Post this.post, @required User this.user, bool this.detail:false});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin:EdgeInsets.only(bottom: 5),
      child: Card(
      elevation: 5.0,
      child: paddingwith(top: 10.0,left: 10.0,right: 10.0,bottom: 10.0
        ,widget: Column(

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              profile_image(url: user.imageUrl,onpressed: null,),
              Column(
                children: <Widget>[
                  myText("${user.name} ${user.surname}" ,color: Colors.black,),
                  myText("${post.date}",color: Colors.red,)

                ],

              )
            ],
          ),
          (post.imageUrl!=null && post.imageUrl!="")?
        paddingwith(widget: Container(width: MediaQuery.of(context).size.width,height: 1.0 ,color: base,),):
          Container(height: 0.0,),

          (post.imageUrl!=null && post.imageUrl!="")?
             paddingwith(widget:
             Container(width: MediaQuery.of(context).size.width*0.85,
                      height: MediaQuery.of(context).size.height*0.85,
              decoration: BoxDecoration(image: DecorationImage(image: CachedNetworkImageProvider(post.imageUrl),fit: BoxFit.cover)),

             )
             ):
          Container(height: 0.0,),
          (post.Text!=null && post.Text!="")?
          paddingwith(widget: Container(width: MediaQuery.of(context).size.width,height: 1.0 ,color: Colors.black,),):
          Container(height: 0.0,),
          (post.Text!=null && post.Text!="")?
              paddingwith(widget: myText(post.Text,color: Colors.black,),):Container(height: 0.0,),
          paddingwith(widget: Container(width: MediaQuery.of(context).size.width,height: 1.0 ,color: base,),),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            IconButton(icon: (post.Likes.contains(me.uid))? LikeFull :likeEmptey, onPressed: null),
              myText(post.Likes.length.toString(),color:pointer),
              IconButton(icon:MsgIcon, onPressed: null),
              myText(post.Commentaire.length.toString(),color:pointer),
            ],
          )

        ],
      ),
      ),
      ),
    );
  }

}

