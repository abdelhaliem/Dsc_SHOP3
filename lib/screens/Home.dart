import 'dart:convert';
import 'package:dsc_shop/API/Api.dart';
import 'package:dsc_shop/model/items.dart';
import 'package:dsc_shop/model/products.dart';
import 'package:dsc_shop/screens/Product_details.dart';
import 'package:dsc_shop/screens/search.dart';
import 'package:dsc_shop/tools/Theme.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Prodaucts>> getData() async {
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

  Future<List<Prodaucts>> users;
  @override
  void initState() {
    super.initState();
    users = getData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeChenger basket = Provider.of<ThemeChenger>(context);
    return Scaffold(
      body: FutureBuilder<List<Prodaucts>>(
        future: users,
        builder: (ctx, snapShout) {
          if (snapShout.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapShout.data.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          id: snapShout.data[i].id,
                          title: snapShout.data[i].title,
                          category: snapShout.data[i].category,
                          description: snapShout.data[i].description,
                          imageUrl: snapShout.data[i].imageUrl,
                          price: snapShout.data[i].price,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shadowColor: Tools.mainColor,
                    margin: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(snapShout.data[i].imageUrl),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              snapShout.data[i].title.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " ج.م ${snapShout.data[i].price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Tools.mainColor,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Tools.mainColor,
                                    ),
                                    onPressed: () {
                                      basket.addCountFav();
                                      ItemModel itemModel = new ItemModel(
                                        id: snapShout.data[i].id,
                                        category: snapShout.data[i].category,
                                        imageUrl: snapShout.data[i].imageUrl,
                                        description:
                                            snapShout.data[i].description,
                                        price: snapShout.data[i].price,
                                        title: snapShout.data[i].title,
                                      );
                                      basket.addItemsFav(itemModel);
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Tools.mainColor,
            ),
          );
        },
      ),
    );
  }
}
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<Prodaucts> allUsers = [];
//   Future<List<Prodaucts>> getData({String querys}) async {
//     String url = "http://fakestoreapi.com/products/";
//     var jsonData = await http.get(Uri.parse(url));
//     if (jsonData.statusCode == 200) {
//       List data = jsonDecode(jsonData.body);

//       for (var j in data) {
//         Prodaucts prodaucts = Prodaucts.fromJason(j);
//         allUsers.add(prodaucts);
//       }
//       return allUsers;
//     } else {
//       throw Exception("error");
//     }
//   }

//   API _listData = API();
//   bool ser = false;
//   @override
//   Widget build(BuildContext context) {
//     ThemeChenger basket = Provider.of<ThemeChenger>(context);
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: FaIcon(FontAwesomeIcons.search),
//         onPressed: () {
//           showSearch(
//             context: context,
//             delegate: SearchProductes(searchList: allUsers.),
//           );
//         },
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.black12,
//                   borderRadius: BorderRadius.circular(50)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         flex: 6,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             onChanged: (value) {
//                               //_filterSearch(value);
//                             },
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: 'Search',
//                                 helperStyle: TextStyle(
//                                   color: Tools.mainColor,
//                                 )),
//                           ),
//                         )),
//                     Expanded(flex: 1, child: FaIcon(FontAwesomeIcons.search)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 10,
//             child:
//                 //  allUsers.length > 0
//                 //     ? GridView.builder(
//                 //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 //           crossAxisCount: 2,
//                 //         ),
//                 //         itemCount: allUsers.length,
//                 //         itemBuilder: (context, i) {
//                 //           return GestureDetector(
//                 //             onTap: () {
//                 //               Navigator.of(context).push(
//                 //                 MaterialPageRoute(
//                 //                   builder: (context) => ProductDetails(
//                 //                     id: allUsers[i].id,
//                 //                     title: allUsers[i].title,
//                 //                     category: allUsers[i].category,
//                 //                     description: allUsers[i].description,
//                 //                     imageUrl: allUsers[i].imageUrl,
//                 //                     price: allUsers[i].price,
//                 //                   ),
//                 //                 ),
//                 //               );
//                 //             },
//                 //             child: Card(
//                 //               color: Colors.white,
//                 //               shadowColor: Tools.mainColor,
//                 //               margin: EdgeInsets.all(5),
//                 //               shape: RoundedRectangleBorder(
//                 //                   borderRadius: BorderRadius.circular(20)),
//                 //               elevation: 3,
//                 //               child: Padding(
//                 //                 padding: const EdgeInsets.all(8.0),
//                 //                 child: Column(
//                 //                   crossAxisAlignment: CrossAxisAlignment.start,
//                 //                   children: [
//                 //                     Expanded(
//                 //                       flex: 4,
//                 //                       child: Container(
//                 //                         decoration: BoxDecoration(
//                 //                           image: DecorationImage(
//                 //                             image: NetworkImage(
//                 //                                 searchList[i].imageUrl),
//                 //                           ),
//                 //                         ),
//                 //                       ),
//                 //                     ),
//                 //                     SizedBox(
//                 //                       height: 10,
//                 //                     ),
//                 //                     Expanded(
//                 //                       flex: 1,
//                 //                       child: Text(
//                 //                         searchList[i].title.toString(),
//                 //                         maxLines: 1,
//                 //                         overflow: TextOverflow.ellipsis,
//                 //                         style: TextStyle(
//                 //                             color: Colors.black,
//                 //                             fontWeight: FontWeight.w600),
//                 //                       ),
//                 //                     ),
//                 //                     Expanded(
//                 //                       flex: 1,
//                 //                       child: Row(
//                 //                         mainAxisAlignment:
//                 //                             MainAxisAlignment.spaceBetween,
//                 //                         children: [
//                 //                           Text(
//                 //                             " ج.م ${searchList[i].price}",
//                 //                             style: TextStyle(
//                 //                               fontWeight: FontWeight.w600,
//                 //                               fontSize: 18,
//                 //                               color: Tools.mainColor,
//                 //                             ),
//                 //                             textAlign: TextAlign.right,
//                 //                           ),
//                 //                           IconButton(
//                 //                               icon: Icon(
//                 //                                 Icons.favorite_border_outlined,
//                 //                                 color: Tools.mainColor,
//                 //                               ),
//                 //                               onPressed: () {
//                 //                                 basket.addCountFav();
//                 //                                 ItemModel itemModel = new ItemModel(
//                 //                                   id: searchList[i].id,
//                 //                                   category: searchList[i].category,
//                 //                                   imageUrl: searchList[i].imageUrl,
//                 //                                   description:
//                 //                                       searchList[i].description,
//                 //                                   price: searchList[i].price,
//                 //                                   title: searchList[i].title,
//                 //                                 );
//                 //                                 basket.addItemsFav(itemModel);
//                 //                               })
//                 //                         ],
//                 //                       ),
//                 //                     )
//                 //                   ],
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //           );
//                 //         },
//                 //       )
//                 //     : Center(child: CircularProgressIndicator()),
//                 FutureBuilder<List<Prodaucts>>(
//               future: _listData.getData(),
//               builder: (ctx, snapShout) {
//                 var data = snapShout.data;
//                 if (!snapShout.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       backgroundColor: Tools.mainColor,
//                     ),
//                   );
//                 }
//                 return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                   ),
//                   itemCount: data.length,
//                   itemBuilder: (context, i) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => ProductDetails(
//                               id: data[i].id,
//                               title: data[i].title,
//                               category: data[i].category,
//                               description: data[i].description,
//                               imageUrl: data[i].imageUrl,
//                               price: data[i].price,
//                             ),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         color: Colors.white,
//                         shadowColor: Tools.mainColor,
//                         margin: EdgeInsets.all(5),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         elevation: 3,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 flex: 4,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: NetworkImage(data[i].imageUrl),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Text(
//                                   data[i].title.toString(),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       " ج.م ${data[i].price}",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18,
//                                         color: Tools.mainColor,
//                                       ),
//                                       textAlign: TextAlign.right,
//                                     ),
//                                     IconButton(
//                                         icon: Icon(
//                                           Icons.favorite_border_outlined,
//                                           color: Tools.mainColor,
//                                         ),
//                                         onPressed: () {
//                                           basket.addCountFav();
//                                           ItemModel itemModel = new ItemModel(
//                                             id: data[i].id,
//                                             category: data[i].category,
//                                             imageUrl: data[i].imageUrl,
//                                             description: data[i].description,
//                                             price: data[i].price,
//                                             title: data[i].title,
//                                           );
//                                           basket.addItemsFav(itemModel);
//                                         })
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
