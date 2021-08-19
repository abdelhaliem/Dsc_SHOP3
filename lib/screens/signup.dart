import 'package:dsc_shop/screens/homescreen.dart';
import 'package:dsc_shop/screens/login.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:dsc_shop/tools/language.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();

  String validusername(String val) {
    if (val
        .trim()
        .isEmpty) {
      return "يجب كتابة اسم المستخدم";
    }
    if (val.length < 4) {
      return "لايمكن ان يكون اسم المستخدم اقل من 4 احرف";
    }
    if (val.length > 20) {
      return "لايمكن ان يكون اسم المستخدم اكثرمن 20 احرف";
    }
  }

  String validpassword(String val) {
    if (val
        .trim()
        .isEmpty) {
      return "يجب كتابة كلمة المرور";
    }
    if (val.length < 8) {
      return "لايمكن لكلمة المرور ان تكون اقل من 8 احرف";
    }
    if (val.length > 30) {
      return "لايمكن لكلمة المرور ان تكون اكثر من 30 احرف";
    }
  }

  String validPhone(String val) {
    if (val
        .trim()
        .isEmpty) {
      return "يجب كتابة رقم الهاتف";
    }
    if (val.length < 8) {
      return "رقم الهاتف غير صحيح";
    }
    if (val.length > 30) {
      return "رقم الهاتف غير صحيح";
    }
  }

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String validemail(String val) {
    if (val
        .trim()
        .isEmpty) {
      return "يجب كتابة البريد الالكتروني";
    }
    if (val.length < 4) {
      return "البريد الالكتروني غير صحيح";
    }

    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "تأكد من عنوان البريد الالكتروني";
    }
  }

  final auth = FirebaseAuth.instance;
  Language _language = Language();

  @override
  void initState() {
    super.initState();
    setState(() => _language.getLanguage());
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tools.mainColor,
        elevation: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Dsc Shop ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/back.jpg"),
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
            fit: BoxFit.cover,
          ),),
        width: size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              width: size.width * 0.9,
              height: size.height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    _language==null? "${_language.tAccount()}":"Create account",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Tools.mainColor),
                  ),
                  SizedBox(height: 30),
                  namefield("Name", false, Icon(Icons.person)),
                  SizedBox(height: 30),
                  phonefield("Phone", false, Icon(Icons.phone)),
                  SizedBox(height: 30),
                  customTextEmail("email", false, Icon(Icons.email)),
                  SizedBox(height: 30),
                  customTextPassword("password", true, Icon(Icons.lock)),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      print(name.text);
                      print(phone.text);
                      auth
                          .createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      )
                          .then(
                            (_) =>
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogIn(),
                                )),
                      );
                    },
                    child: Text("Sign Up "),
                    style: ElevatedButton.styleFrom(
                      primary: Tools.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget namefield(hint, obsecure, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          controller: name,
          obscureText: obsecure,
          decoration: InputDecoration(
            labelText: '$hint',
            labelStyle: TextStyle(color: Tools.mainColor),
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
          ),
          validator: validPhone),
    );
  }

  Widget phonefield(hint, obsecure, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          controller: phone,
          obscureText: obsecure,
          decoration: InputDecoration(
            labelText: '$hint',
            labelStyle: TextStyle(color: Tools.mainColor),
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
          ),
          validator: validusername),
    );
  }

  Widget customTextEmail(hint, obsecure, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          controller: email,
          obscureText: obsecure,
          decoration: InputDecoration(
            labelText: '$hint',
            labelStyle: TextStyle(color: Tools.mainColor),
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
          ),
          validator: validemail),
    );
  }

  Widget customTextPassword(hint, obsecure, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          controller: password,
          obscureText: obsecure,
          decoration: InputDecoration(
            labelText: '$hint',
            labelStyle: TextStyle(color: Tools.mainColor),
            prefixIcon: icon,
            suffixIcon: IconButton(
                icon: Icon(obsecure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    obsecure = !obsecure;
                  });
                }),
            //suffixIcon: icon(Icons.visibility),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Tools.mainColor),
                borderRadius: BorderRadius.circular(10)),
          ),
          validator: validpassword),
    );
  }
}
