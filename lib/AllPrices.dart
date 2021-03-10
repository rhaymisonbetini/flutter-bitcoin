import 'package:flutter/material.dart';
import 'package:flutter_bitcoin_price/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllPrices extends StatefulWidget {
  @override
  _AllPrices createState() => _AllPrices();
}

class _AllPrices extends State<AllPrices> {
  String _urlBase = 'https://jsonplaceholder.typicode.com';

  Post post = new Post(0, 0, "", "");

  // ignore: missing_return
  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];
    for (var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("consumo de serviço avançado"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List<Post> lista = snapshot.data;
                    Post post = lista[index];

                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              }
              break;
          }
        },
      ),
    );
  }
}
