import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//start form controller
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  TextEditingController email = new TextEditingController();

  GlobalKey<FormState> formstatesignIn = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignUp = new GlobalKey<FormState>();

  String validglobal(String val) {
    if (val.isEmpty) {
      return "field can't empty";
    }
  }

  Future signin() async {
    var formdata = formstatesignIn.currentState;
    if (formdata.validate()) {
      formdata.save();

      var data = {"email": email.text, "password": password.text};
      print(data);

      //var url = "http://10.0.2.2:80/odhiya/login.php";
      var response = await http
          .post(Uri.http('10.0.2.2:80', 'odhiya/login.php'), body: data);

      print(response.statusCode);

      var responsebody = jsonDecode(response.body);

      if (responsebody['status'] == "success") {
        print(responsebody);
      } else {
        print("login faild");
      }
    } else {
      print("not valid");
    }
  }

//end form controller

  TapGestureRecognizer _changesign;
  bool showsignin = true;

  @override
  void initState() {
    _changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
          print(showsignin);
        });
      };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Stack(children: <Widget>[
          Container(height: double.infinity, width: double.infinity),
          buildPositionedtop(mdw),
          buildPositionedbottom(mdw),
          Container(
            height: 1000,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Center(
                  child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  showsignin ? "تسجيل الدخول" : " انشاء حساب",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )),
              Padding(padding: EdgeInsets.only(top: 20)),
              buildContainerAvatar(mdw),
              showsignin ? buildFormBoxSignIn(mdw) : buildFormBoxSignUp(mdw),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Text("هل نسيت كلمة المرور؟",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                    ),
                    SizedBox(height: 24),

                    // RaisedButton :signin
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.blue,
                        onPressed: signin,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("تسجيل الدخول",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Container(
                                margin: EdgeInsets.only(top: 4),
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.white)),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Cairo'),
                          children: <TextSpan>[
                            TextSpan(
                                text: showsignin
                                    ? "في حال ليس  لديك حساب يمكنك"
                                    : "في حال  لديك حساب يمكنك "),
                            TextSpan(
                                recognizer: _changesign,
                                text: showsignin
                                    ? " انشاء حسابك هنا"
                                    : "تسجيل الدخول",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700))
                          ],
                        ))),
                  ],
                ),
              ),
            ])),
          )
        ])));
  }

  Center buildFormBoxSignUp(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        margin: EdgeInsets.only(top: 40),
        height: 400,
        width: mdw / 1.3,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1.5, 1.5))
        ]),
        child: Form(
            key: formstatesignUp,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //start Text user name

                    Text("اسم المستخدم", style: TextStyle(color: Colors.blue)),
                    SizedBox(height: 10),
                    buildTextFormFieldAll(
                        "ادخل اسم المستخدم هنا", false, username, validglobal),

                    //end Text user name
                    SizedBox(height: 10),

                    //start Text password

                    Text("كلمة المرور", style: TextStyle(color: Colors.blue)),
                    SizedBox(height: 10),
                    buildTextFormFieldAll(
                        "ادخل كلمة المرور ", true, password, validglobal),

                    SizedBox(height: 10),

                    Text(" تاكيد كلمة المرور",
                        style: TextStyle(color: Colors.blue)),
                    SizedBox(height: 10),
                    buildTextFormFieldAll("ادخل كلمة المرور مرة اخرى ", true,
                        confirmpassword, validglobal),
                    // end pass word

                    // start add email
                    SizedBox(height: 10),
                    Text(" البريد الالكتروني",
                        style: TextStyle(color: Colors.blue)),
                    SizedBox(height: 10),
                    buildTextFormFieldAll(
                        "ادخل البريد الاكتروني  ", false, email, validglobal),

                    //end add email
                  ],
                ),
              ),
            )),
      ),
    );
  }

  TextFormField buildTextFormFieldAll(String myhinttext, bool pass,
      TextEditingController myController, myvalid) {
    return TextFormField(
        controller: myController,
        obscureText: pass,
        validator: myvalid,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            hintText: myhinttext,
            filled: true,
            fillColor: Colors.grey[200],
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey[500],
                    style: BorderStyle.solid,
                    width: 1)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue[500],
                    style: BorderStyle.solid,
                    width: 1))));
  }

  Center buildFormBoxSignIn(double mdw) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: 40),
        height: 250,
        width: mdw / 1.3,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1.5, 1.5))
        ]),
        child: Form(
            key: formstatesignIn,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //start Text user name

                    Text("اسم المستخدم", style: TextStyle(color: Colors.blue)),
                    SizedBox(height: 10),
                    buildTextFormFieldAll(
                        "ادخل اسم المستخدم هنا", false, email, validglobal),

                    //end Text user name
                    SizedBox(height: 10),

                    //start Text password

                    Text("كلمة المرور", style: TextStyle(color: Colors.blue)),
                    SizedBox(height: 10),
                    buildTextFormFieldAll(
                        "ادخل اسم المستخدم هنا", false, password, validglobal),

                    //end Text password
                  ],
                ),
              ),
            )),
      ),
    );
  }

  AnimatedContainer buildContainerAvatar(double mdw) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: showsignin ? Colors.yellow : Colors.grey,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 40)]),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 25,
                left: 20,
                child:
                    Icon(Icons.person_outline, size: 50, color: Colors.white)),
            Positioned(
                top: 30,
                left: 50,
                child: Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: Colors.white,
                ))
          ],
        ));
  }

  Positioned buildPositionedtop(double mdw) {
    return Positioned(
        child: Transform.scale(
      scale: 1.8,
      child: Transform.translate(
        offset: Offset(0, -mdw / 1.7),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: mdw,
            width: mdw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color: showsignin ? Colors.green[400] : Colors.blue[200])),
      ),
    ));
  }

  Positioned buildPositionedbottom(double mdw) {
    return Positioned(
      top: 280,
      right: mdw / 1.4,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: showsignin ? Colors.blue[200] : Colors.green[400])),
    );
  }
}
