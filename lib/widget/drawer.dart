import 'package:dsc_shop/main.dart';
import 'package:dsc_shop/screens/drawerScreens/about.dart';
import 'package:dsc_shop/screens/setting.dart';
import 'package:dsc_shop/tools/Theme.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:dsc_shop/tools/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool theme = false;
  Language _language = Language();
  List<String> _languages = ['AR', 'EN'];
  String _slLanguage;
  @override
  void initState() {
    super.initState();
    setState(() => _language.getLanguage());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ThemeChenger _themeChenger = Provider.of<ThemeChenger>(context);
    return Drawer(
      child: Container(
        // width: size.width / 3,
        color: theme ? Colors.black : Colors.white,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Tools.mainColor,
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(5, 5))
                    ],
                    borderRadius: BorderRadius.circular(40)),
                width: size.width * 0.6,
                height: size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage("images/mainlo.png"))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Halem Hamza",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "halemhamza@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text("${_language.tLanguage()}",
                  style: TextStyle(
                      color: theme ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600)),
              leading: Icon(
                Icons.language,
                color: Tools.mainColor,
              ),
              trailing: DropdownButton(
                value: _slLanguage,
                items: [
                  DropdownMenuItem(
                    child: Text("EN"),
                    value: 'EN',
                  ),
                  DropdownMenuItem(
                    child: Text("AR"),
                    value: 'AR',
                  ),
                ],
                hint: Text("${ _language==null?"Language":_language.tLanguage()}"),
                onChanged: (newValue) async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('language', newValue);
                  _language.setLanguage(newValue);
                  language = newValue;
                  setState(() {
                    _slLanguage = newValue;
                  });
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text( _language==null?"LogOut":"${_language.tLogOut()}",
                  style: TextStyle(
                      color: theme ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600)),
              leading: Icon(
                Icons.logout,
                color: Tools.mainColor,
              ),
              onTap: () {
                _themeChenger.logout(context);
              },
            ),
            ListTile(
              title: Text(
                _language==null?"About":"${_language.tAbout()}",
                style: TextStyle(
                    color: theme ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              leading: Icon(
                Icons.book_outlined,
                color: Tools.mainColor,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              title: Text(
                _language==null?"Setting":"${_language.tSetting()}",
                style: TextStyle(
                    color: theme ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              leading: Icon(
                Icons.settings,
                color: Tools.mainColor,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            ListTile(
              title: Text( _language==null?"DarkMode":"${_language.tDarkMode()}",
                  style: TextStyle(
                      color: theme ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600)),
              leading: Icon(
                Icons.nights_stay,
                color: Tools.mainColor,
              ),
              trailing: Switch(
                  value: theme,
                  onChanged: (val) {
                    setState(() {
                      if (theme = val) {
                        val = _themeChenger.setTheme(
                          ThemeData(
                            backgroundColor: Colors.black,
                            accentColor: Colors.black,
                            scaffoldBackgroundColor: Colors.black,
                            colorScheme: ColorScheme.dark(),
                            primaryColor: Colors.black,
                            primaryColorDark: Colors.black,
                            switchTheme: SwitchThemeData(
                                thumbColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                                trackColor: MaterialStateProperty.all(
                                  Tools.mainColor,
                                )),
                          ),
                        );
                      } else {
                        val = _themeChenger.setTheme(
                          ThemeData(
                            scaffoldBackgroundColor: Colors.white,
                            primaryColor: Tools.mainColor,
                            colorScheme: ColorScheme.light(),
                            switchTheme: SwitchThemeData(
                              thumbColor:
                                  MaterialStateProperty.all(Colors.white),
                              trackColor:
                                  MaterialStateProperty.all(Tools.mainColor),
                            ),
                          ),
                        );
                      }
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
