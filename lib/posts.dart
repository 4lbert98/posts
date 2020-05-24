//*
//Esta clase se genera a partir de un archivo json, con un convertidor Json to dart para obtener las publicaciones y comentarios
//del archivo Json que se encuentra en la URL
class Posts1 {
  int userId;
  int id;
  String title;
  String body;

  Posts1(this.userId, this.id, this.title, this.body);

  Posts1.fromJson(Map<String, dynamic> json){
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);

  Comment.fromJson(Map<String, dynamic> json){
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}