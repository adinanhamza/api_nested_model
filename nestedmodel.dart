
  
class Post{
  String id;
String title;
String content;
Author author;
List <Comment> commentes;

Post({required this.content,required this.id,required this.title,required this.author,required this.commentes});

factory Post.fromjson(Map<String,dynamic>json){
  final postjson = json['post'] ?? {};
  return Post(
    author: Author.fromjson(postjson['author'] ?? {}),
content: postjson['content'] ?? '',
id: postjson['id'].toString(),
title: postjson['title'] ?? '',
commentes: ( postjson['comments'] as List <dynamic>? ?? []).map((e) => Comment.fromjson(e)).toList() ,
  );
}

Map<String,dynamic>toJson(){
  return {
'id' : id,
'title' : title,
'content' : content,
'author' : author.toJson(),
'comments'  : commentes.map((comment)=> comment.toJson()).toList(),
  };
}
}


class Author{

  String id ;
  String name;
  Profile profile;
  Author({required this.id,required this.name,required this.profile});

  factory Author.fromjson(Map<String,dynamic>json){
    return Author(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      profile: Profile.fromjson(json['profile'] ?? {}
      )
      );
     }
Map<String,dynamic>toJson(){
  return {
   'id' : id,
   'name' : name,
   'profile' : profile.toJson(),

  };
}

}

class Profile{
  String bio;
String website;

Profile({required this.bio,required this.website});

factory Profile.fromjson(Map<String,dynamic>json){
 return Profile(
bio: json['bio'] ?? '',
website: json['website'] ?? '',
  );
}

Map<String,dynamic>toJson(){
  return {
'bio' : bio,
'website' : website, 
  };
}
}

class Comment{
String id;
String content;
Commenter commenter;
Comment({required this.content,required this.id,required this.commenter});

factory Comment.fromjson(Map<String,dynamic>json){
  return Comment(
content: json['content'] ?? '',
id: json['id'].toString(),
commenter: Commenter.fromjson(json['commenter']  ?? {}) 

  );
}

Map<String,dynamic>toJson(){
  return{
'id' : id,
'content' : content,
'commenter' : commenter.toJson(),
  };
}
}

class Commenter{
  String id;
String name;
String email;

Commenter({required this.email,required this.id,required this.name});

factory Commenter.fromjson(Map<String,dynamic>json){
 return Commenter(
    email: json['email'] ?? '',
    id: json['id'].toString(),
    name: json['name'] ?? ''
  );
}


Map<String,dynamic>toJson(){
  return{
'id' : id,
'name' : name,
'email' : email,
  };
}
}

// {
//   "post": {
//     "id": 123,
//     "title": "Understanding Nested JSON",
//     "content": "This post explains how to handle nested JSON data...",
//     "author": {
//       "id": 1,
//       "name": "Jane Doe",
//       "profile": {
//         "bio": "Avid writer and data enthusiast.",
//         "website": "https://janedoe.com"
//       }
//     },
//     "comments": [
//       {
//         "id": 1001,
//         "content": "Great post! Very informative.",
//         "commenter": {
//           "id": 2,
//           "name": "John Smith",
//           "email": "johnsmith@example.com"
//         }
//       },
//       {
//         "id": 1002,
//         "content": "Thanks for the insights.",
//         "commenter": {
//           "id": 3,
//           "name": "Emily Johnson",
//           "email": "emilyj@example.com"
//         }
//       }
//     ]
//   }
// }

