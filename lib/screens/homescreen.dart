import 'package:dsc_shop/screens/Favorite.dart';
import 'package:dsc_shop/screens/Home.dart';
import 'package:dsc_shop/screens/Shopping.dart';
import 'package:dsc_shop/screens/search.dart';
import 'package:dsc_shop/tools/Theme.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:dsc_shop/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  int curTap = 0;
  final List<Widget> screens = [
    Home(),
    Favorite(),
    Shopping(),
  ];
  Widget curScreen = Home();

  @override
  Widget build(BuildContext context) {
    ThemeChenger basket = Provider.of<ThemeChenger>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
        width: size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
          color: Tools.mainColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: bottomNav(
                  icon: FontAwesomeIcons.home,
                  numColor: 0,
                  onPressed: () {
                    setState(() {
                      curTap = 0;
                      curScreen = Home();
                    });
                  }),
            ),
            Expanded(
              flex: 1,
              child: bottomNav(
                  icon: FontAwesomeIcons.heart,
                  numColor: 1,
                  onPressed: () {
                    setState(() {
                      curTap = 1;
                      curScreen = Favorite();
                    });
                  }),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  bottomNav(
                      icon: FontAwesomeIcons.shoppingBasket,
                      numColor: 2,
                      onPressed: () {
                        setState(() {
                          curTap = 2;
                          curScreen = Shopping();
                        });
                      }),
                  Container(
                    width: 25,
                    height: 25,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      "${basket.items.length.toString()}",
                      style: TextStyle(
                        color: Tools.mainColor,
                      ),
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
      body: Stack(
        children: [
          PageStorage(
            bucket: bucket,
            child: curScreen,
          ),
        ],
      ),
    );
  }

  Widget bottomNav({icon, onPressed, title, int numColor}) {
    return Column(
      children: [
        IconButton(
          icon: FaIcon(
            icon,
            color: curTap == numColor ? Colors.amber[400] : Colors.white,
            size: 25,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
