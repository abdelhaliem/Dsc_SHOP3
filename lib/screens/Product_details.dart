import 'package:dsc_shop/model/items.dart';
import 'package:dsc_shop/tools/Theme.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:dsc_shop/tools/language.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final id;
  final title;
  final price;
  final description;
  final category;
  final imageUrl;

  const ProductDetails({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.imageUrl,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Language _language = Language();
  @override
  void initState() {
    super.initState();
    setState(() => _language.getLanguage());
  }

  @override
  Widget build(BuildContext context) {
    ThemeChenger basket = Provider.of<ThemeChenger>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: FaIcon(
            FontAwesomeIcons.shoppingBasket,
            color: Tools.mainColor,
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            basket.addCount();
            ItemModel itemModel = new ItemModel(
              id: widget.id,
              category: widget.category,
              imageUrl: widget.imageUrl,
              description: widget.description,
              price: widget.price,
              title: widget.title,
            );
            basket.addItems(itemModel);
          },
        ),
        appBar: AppBar(
          elevation: 0,
//          backwardsCompatibility: ,
          backgroundColor: Colors.white.withOpacity(1.0),
          actions: [
            icons(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
          leading: icons(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.white,
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Tools.mainColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                right: 10,
                                left: 12,
                                bottom: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        "${widget.title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.attach_money,
                                            size: 25,
                                            color: Tools.mainColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, bottom: 5),
                                            child: Text(
                                              widget.price.toString(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text(
                                "${_language.tDescription().toString()}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text(
                               "${widget.description.toString()}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 8,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 15),
                                  child: Text(
                                    _language==null?"Category":"${_language.tCategory()}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 5),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          bottom: 7,
                                          right: 15,
                                          left: 15),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(2, 2))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.white),
                                      child: Text(
                                        widget.category,
                                        style: TextStyle(
                                          color: Tools.mainColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget icons({icon, onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Tools.mainColor,
        ),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
