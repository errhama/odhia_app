import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future getData() async {
    // var url = "https://jsonplaceholder.typicode.com/posts";
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 9,
              itemBuilder: (context, i) {
                return Container(
                  child: Text(snapshot.data[i]['title']),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
