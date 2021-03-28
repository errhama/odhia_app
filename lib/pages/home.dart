import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../compount/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var listsearch = [];
  Future getData() async {
    //var url = "http://10.0.2.2:80/odhiya/search.php";
    var response = await http.get(Uri.http('10.0.2.2:80', 'odhiya/search.php'));

    var responsebody = jsonDecode(response.body);

    print(responsebody);

    for (int i = 0; i < responsebody.length; i++) {
      listsearch.add(responsebody[i]["race"]);
    }
    print(listsearch);
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Odhia"),
            backgroundColor: Colors.green,

            centerTitle: true,
            elevation: 8, //shadow
            actions: [
              IconButton(
                //icon search
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: DataSearch(list: listsearch));
                },
              )
            ],

            // leading se situe avant home et avant actions
          ),
          drawer: MyDrawer(),
          body: ListView(
            children: <Widget>[
              Container(
                height: 300.0,
                width: double.infinity,
                child: Carousel(
                  images: [
                    AssetImage(
                      'images/odhiya_logo.png',
                    ),
                    AssetImage('images/goat_goat.jpg'),
                    AssetImage('images/logo_logo.png'),
                  ],
                  dotSize: 8,
                  dotIncreaseSize: 2,
                  dotSpacing: 20,
                  dotColor: Colors.white,
                  dotBgColor: Colors.green.withOpacity(0.5),
                  boxFit: BoxFit.cover,
                  overlayShadow: true,
                  overlayShadowColors: Colors.green,
                  overlayShadowSize: 0.1,
                ),
              ),
              //end caresoul
              Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                            title: Image.asset('images/livraison.jpg'),
                            subtitle: Container(
                                child: Text("Livraison",
                                    textAlign: TextAlign.center))),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                            title: Image.asset('images/lad.gif'),
                            subtitle: Container(
                                child: Text("Livraison",
                                    textAlign: TextAlign.center))),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                            title: Image.asset('images/livraison.jpg'),
                            subtitle: Container(
                                child: Text("Livraison",
                                    textAlign: TextAlign.center))),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: ListTile(
                            title: Image.asset('images/lad.gif'),
                            subtitle: Container(
                                child: Text("Livraison",
                                    textAlign: TextAlign.center))),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}

//search adveced
class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  DataSearch({this.list});
  @override
  List<Widget> buildActions(BuildContext context) {
    // action for appbar
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon leading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // results search
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist =
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
    // show when someone search for somthing
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.mobile_screen_share),
            title: Text(searchlist[i]),
          );
        });
  }
}
