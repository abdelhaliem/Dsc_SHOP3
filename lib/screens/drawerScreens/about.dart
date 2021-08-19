import 'package:dsc_shop/tools/Theme.dart';
import 'package:dsc_shop/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  Future<void> _launch;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ThemeChenger urlLauncher = Provider.of<ThemeChenger>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("About"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "This application is an onLine store, the application is easy, simple and secure",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Created with : ",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          FlutterLogo(),
                          Text("Flutter Cross Platform"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Tools.mainColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Created and Developed by =>",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(flex: 1, child: SizedBox()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width / 2.7,
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [BoxShadow(offset: Offset(4, 4))],
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/151302916_2526024984366934_4606042628157522775_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEqC9HNT3DXwy41G9z9xFGAVnjmGAyUhxlWeOYYDJSHGSjGBJAd6wXvyaOfJGsl7Cqjxkl2M8Ky2_KE6eTlYnRX&_nc_ohc=UVdnd1vcr7AAX94tekr&_nc_ht=scontent.fcai1-2.fna&oh=390823aa097c529517ac44b847ec4ff4&oe=613DFD66'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.code,
                          colorIcon: Colors.black,
                          text: "Mobile application dev",
                          colorText: Colors.black,
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.github,
                          colorIcon: Colors.black,
                          text: "mohammadfaidi",
                          colorText: Colors.black,
                          onTap: () {
                            _launch = urlLauncher
                                .gitHup("https://github.com/mohammadfaidi");
                          },
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.envelope,
                          colorIcon: Colors.amber,
                          text: "MohamadFaidi",
                          colorText: Colors.amber,
                          onTap: () {
                            _launch = urlLauncher.email(
                                "mailto:mohamadfaidi@outlook.com?subject=UrlPackage&body=It is awesome");
                          },
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.facebook,
                          colorIcon: Colors.blue[900],
                          text: "Mohammad Faidi",
                          colorText: Colors.blue[900],
                          onTap: () {
                            _launch = urlLauncher.faceBook(
                                "https://web.facebook.com/profile.php?id=100008783705032");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: UrlLauncher(
                            icon: FontAwesomeIcons.mobile,
                            colorIcon: Colors.orangeAccent,
                            text: " 00972598178584",
                            colorText: Colors.orange,
                            onTap: () {
                              _launch = urlLauncher.phone("tel:00972598178584");
                            },
                          ),
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.sms,
                          colorIcon: Colors.teal,
                          text: "00972598178584",
                          colorText: Colors.teal,
                          onTap: () {
                            _launch = urlLauncher.sms("sms:00972598178584");
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width / 2.7,
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [BoxShadow(offset: Offset(4, 4))],
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/234641892_1934125243415299_4663317802053806720_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeF7Wxtb-pzUkxIGUNpC8fBMD_mDip3Cyu4P-YOKncLK7pyr1AfR72-0BJE9UIxN--bRAg2PuRINB5DWG8izW2Te&_nc_ohc=efKdhtwv4K8AX-_COJs&_nc_ht=scontent.fcai1-2.fna&oh=1437eb8a9fa3b6906e6f024d4b991933&oe=613C857C'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.code,
                          colorIcon: Colors.black,
                          text: "Mobile application dev",
                          colorText: Colors.black,
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.github,
                          colorIcon: Colors.black,
                          text: "halemhamzatt",
                          colorText: Colors.black,
                          onTap: () {
                            _launch = urlLauncher
                                .gitHup("https://github.com/abdelhaliem");
                          },
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.envelope,
                          colorIcon: Colors.amber,
                          text: "halemhamzatt",
                          colorText: Colors.amber,
                          onTap: () {
                            _launch = urlLauncher.email(
                                "mailto:halemhamzatt@gmail.com?subject=UrlPackage&body=It is awesome");
                          },
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.facebook,
                          colorIcon: Colors.blue[900],
                          text: "Abd Elhalim Hamza",
                          colorText: Colors.blue[900],
                          onTap: () {
                            _launch = urlLauncher
                                .faceBook("https://web.facebook.com/ememsm/");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: UrlLauncher(
                            icon: FontAwesomeIcons.mobile,
                            colorIcon: Colors.orangeAccent,
                            text: " 01069991770",
                            colorText: Colors.orange,
                            onTap: () {
                              _launch = urlLauncher.phone("tel:01069991770");
                            },
                          ),
                        ),
                        UrlLauncher(
                          icon: FontAwesomeIcons.sms,
                          colorIcon: Colors.teal,
                          text: "01069991770",
                          colorText: Colors.teal,
                          onTap: () {
                            _launch = urlLauncher.sms("sms:01069991770");
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget UrlLauncher({
    onTap,
    icon,
    colorIcon,
    colorText,
    text,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            FaIcon(
              icon,
              color: colorIcon,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
