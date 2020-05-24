import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:posts/posts.dart';


class Data {
  Future<List<Posts1>> getPost() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);
    var posts = List<Posts1>();

    if (response.statusCode == 200) {
      var postsJson = json.decode(response.body);

      for (var postJson in postsJson) {
        posts.add(Posts1.fromJson(postJson));
      }

    }

    return posts;
  }
  // async y await se utlizan para tipos de datos que en un futuro tendran un valor
  Future<List<Comment>> getComments(int postId) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    var response = await http.get(url);
    var comments = List<Comment>();

    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);

      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }
}
