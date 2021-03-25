import 'package:flutter/material.dart'; // ce package est obligatoire; pour le design

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("hamza.errahma@outlook.com"),
            accountName: Text("Hamza ERRAHMA"),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  image: AssetImage('images/odhiya_logo.png'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            title: Text("الصفحة الرئيسية",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.home, color: Colors.blue, size: 20),
            onTap: () {
              print("tap");
            },
          ),
          ListTile(
            title: Text("التسوق",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              print("tap1");
            },
          ),
          ListTile(
            title: Text("المناسبات",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              print("tap1");
            },
          ),
          ListTile(
            title: Text("اضف اعلانك",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              print("tap1");
            },
          ),
          ListTile(
            title: Text("معلومات عنا",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              print("tap1");
            },
          ),
          ListTile(
            title: Text("اتصل بنا",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              print("tap1");
            },
          ),
          ListTile(
            title: Text("حسابي",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              Navigator.of(context).pushNamed("login");
            },
          ),
          ListTile(
            title: Text("لغتي",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              print("tap1");
            },
          ),
          ListTile(
            title: Text("سلتي",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            leading: Icon(Icons.shopping_basket, color: Colors.blue, size: 20),
            onTap: () {
              print("tap1");
            },
          ),
        ],
      ),
    );
  }
}
