import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:posts/posts.dart';
import 'data.dart';


class Comments extends StatefulWidget {
  final Posts1 post;
  Comments({@required this.post});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Data data = new Data();
  List<Comment> _comments = List<Comment>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.getComments(widget.post.id).then((value) => setState(() { //setState actualiza la pantalla
      _comments.addAll(value);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentario",),
          backgroundColor: Colors.purple,
        ),
        body: post==null ? Center( child: CircularProgressIndicator(),) : //Si el contenido es nulo muestra un simbolo de espera para indicar al usuario
        //que esta en espera, y cuando no es nulo muestra el SingleChildScrollView
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(5),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, right: 20.0, left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            widget.post.title,
                            style: TextStyle(
                                color: Colors.white10,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\n${widget.post.body}",
                            style: TextStyle(color: Colors.black87,),
                          ),
                          Image.network('https://i1.wp.com/criterionoticias.com/wp-content/uploads/2020/01/78769083-sello-postal-y-bandera-del-grunge-de-m%C3%A9xico-en-el-fondo-blanco.jpg?fit=1300%2C780&ssl=1')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              color: Colors.red,
                              iconSize: 24,
                              icon: Icon(Icons.thumb_up),
                              onPressed: () {},
                            ),
                            Text(
                              "45",
                              style:
                              TextStyle(color: Colors.black45, fontSize: 20),
                            ),
                            IconButton(
                              color: Colors.red,
                              iconSize: 24,
                              icon: Icon(Icons.thumb_down),
                              onPressed: () {},
                            ),
                            Text(
                              "${_comments.length}",
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            IconButton(
                              color: Colors.red,
                              iconSize: 24,
                              icon: Icon(Icons.comment),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView.builder(
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                                title: Text(
                                  _comments[index].name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                    "${_comments[index].email}\n\n${_comments[index].body}",
                                    style: TextStyle(color: Colors.black)),
                                isThreeLine: true,
                                dense: false,
                                leading: CircleAvatar(
                                  backgroundImage:
                                  NetworkImage('https://pngimage.net/wp-content/uploads/2018/05/comments-png-3.png'),
                                )),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}