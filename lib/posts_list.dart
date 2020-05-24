import 'package:flutter/material.dart';
import 'package:posts/posts.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  String url ="https://jsonplaceholder.typicode.com/posts"; //Direccion url donde se encuentra el archivo json, y de donde se parsean los datos para los posts y comentarios
  Posts1 posts;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
