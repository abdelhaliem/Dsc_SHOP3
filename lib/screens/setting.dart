import 'dart:io';
import 'package:dsc_shop/model/Cloud.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final auth = FirebaseAuth.instance;

  File file;

  UploadTask uploadTask;
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      url != null
                          ? Container(
                              height: 500,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: 500,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage("images/MainLogo.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Tools.mainColor,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                sllected().then((value) => value=uplodFile());
                              },
                              icon: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: SizedBox()),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 18,
                      color: Tools.mainColor,
                      //    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Items(title: "AbdElhalem Emad"),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                      color: Tools.mainColor,
                      //    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Items(title: "halemhamzatt@gmail.com")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Items({String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        // height: 70,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sllected() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      return;
    }
    final path = result.files.single.path;

    setState(() {
      file = File(path);
    });
  }

  Future<void> uplodFile() async {
    if (file == null) return null;
    final filename = file.path;
    final path = 'images/$filename';
    uploadTask = CloudStorage.uploadFile(path, file);
    if (uploadTask == null) return;
    final snapShot = await uploadTask.whenComplete(() {});
    final urlDownlod = await snapShot.ref.getDownloadURL();
    setState(() {
      url = urlDownlod;
    });
  }
}
