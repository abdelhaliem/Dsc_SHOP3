import 'package:dsc_shop/model/items.dart';
import 'package:dsc_shop/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemeChenger with ChangeNotifier {
  ///basket=============
  List<ItemModel> items = [];
  int _count = 0;
  void addCount() {
    _count++;
    notifyListeners();
  }

  void addItems(ItemModel data) {
    items.add(data);
    notifyListeners();
  }

  int get count {
    return _count;
  }

  List<ItemModel> get itemsList {
    return items;
  }

  ///basket==================
  ///fav=====================
  List<ItemModel> itemsfav = [];
  int _countfav = 0;

  void addCountFav() {
    _count++;
    notifyListeners();
  }

  void addItemsFav(ItemModel data) {
    itemsfav.add(data);
    notifyListeners();
  }

  int get countFav {
    return _count;
  }

  List<ItemModel> get itemsListFav {
    return itemsfav;
  }

  /// fav========================
  /// theme ======================
  ThemeData _themeData;
  ThemeChenger(
    this._themeData,
  );
  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  ///theme ======================
  ///Url Launcher
  Future<void> phone(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> sms(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> email(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> gitHup(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> faceBook(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(),
        ));
  }
}
