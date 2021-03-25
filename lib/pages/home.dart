import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../compount/mydrawer.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
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
                icon: Icon(Icons.search),
                onPressed: () {},
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
