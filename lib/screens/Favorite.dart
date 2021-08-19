import 'package:dsc_shop/screens/Product_details.dart';
import 'package:dsc_shop/tools/Theme.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChenger basket = Provider.of<ThemeChenger>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: basket.itemsfav.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          id: basket.itemsfav[i].id,
                          title: basket.itemsfav[i].title,
                          category: basket.itemsfav[i].category,
                          description: basket.itemsfav[i].description,
                          imageUrl: basket.itemsfav[i].imageUrl,
                          price: basket.itemsfav[i].price,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shadowColor: Tools.mainColor,
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
                                      NetworkImage(basket.itemsfav[i].imageUrl),
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
                              basket.itemsfav[i].title.toString(),
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
                                  " ج.م ${basket.itemsfav[i].price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Tools.mainColor,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Tools.mainColor,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return CupertinoAlertDialog(
                                          content: Container(
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                      "Do you want to delete the Product?"),
                                                ),
                                                Divider(),
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          basket.itemsfav
                                                              .removeAt(i);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Ok"))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
