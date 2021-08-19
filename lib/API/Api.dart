import 'dart:convert';
import 'package:dsc_shop/model/products.dart';
import 'package:http/http.dart' as http;

class API {
  Future<List<Prodaucts>> getData({String querys, List searchList}) async {
    String url = "http://fakestoreapi.com/products/";
    var jsonData = await http.get(Uri.parse(url));
    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<Prodaucts> allUsers = [];
      for (var j in data) {
        Prodaucts prodaucts = Prodaucts.fromJason(j);
        allUsers.add(prodaucts);
      }
      return allUsers;
    } else {
      throw Exception("error");
    }
  }
}
