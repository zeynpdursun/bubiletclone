import 'dart:math';

import 'package:bubilet/appbar.dart';
import 'package:bubilet/drawer.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class trendler extends StatefulWidget {
  const trendler({Key? key}) : super(key: key);

  @override
  State<trendler> createState() => _trendlerState();
}

class _trendlerState extends State<trendler> {
  int sekme = 0;
  var categorilist = [
    "konser",
    "tiyatro",
    "festival",
    "çocuk aktiviteleri",
    "blog"
  ];
  List<IconData> categoriesitem = [
    Icons.library_music_sharp,
    Icons.theater_comedy,
    Icons.festival_outlined,
    Icons.sports_esports_outlined,
    Icons.import_contacts_outlined
  ];
  TextEditingController etkinlik = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 216, 230, 223),
        body: Scrollbar(
          child: ListView(children: [
            PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor: Color.fromARGB(255, 27, 231, 27),
                title: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset("assets/bubilet.png"),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, "/konum");
                      });
                    },
                    icon: Icon(Icons.location_on),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
                  color: Color.fromARGB(255, 216, 230, 223),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromARGB(255, 27, 231, 27),
                      ),
                      Positioned(
                        top: -0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/bilet.jpeg",
                          ),
                        ),
                      ),
                      Positioned(child: searchbar()),
                      Positioned(
                        bottom: 0,
                        top: 230,
                        left: 0,
                        right: 0,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 5,
                          ),
                          itemCount: categorilist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return kategoributon(
                              context,
                              categorilist[index],
                              categoriesitem[index],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Adana Etkinlikleri",
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    FloatingActionButton(
                      child: Icon(
                        Icons.display_settings_rounded,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.dashboard_outlined),
                            color: Color.fromARGB(255, 27, 231, 27),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            color: Color.fromARGB(255, 27, 231, 27),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: etk(
                          context,
                          AssetImage("assets/unnamed.jpg"),
                          "Burda Olan Burda Kalır ",
                          "01 burda PGM Sahne-A",
                          "10 Nisan Pzt - 20.30",
                          "168.00 TL"),
                    ),
                    Expanded(
                        child: etk(
                            context,
                            AssetImage("assets/etk.jpeg"),
                            "Aşk İle",
                            "01 burda PGM Sahne-A",
                            "28 Nisan Cuma - 20.30",
                            "113.00 TL")),
                  ],
                )
              ],
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "",
              backgroundColor: Color.fromARGB(255, 27, 231, 27),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: "",
              backgroundColor: Color.fromARGB(255, 27, 231, 27),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.window_rounded), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.share_outlined),
              label: "",
              backgroundColor: Color.fromARGB(255, 27, 231, 27),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "",
              backgroundColor: Color.fromARGB(255, 27, 231, 27),
            ),
          ],
          currentIndex: sekme,
          onTap: (int i) {
            switch (i) {
              case 0:
                setState(() {
                  sekme = 0;
                  Navigator.pushNamed(context, "/trend");
                });
                break;
              case 1:
                setState(() {
                  sekme = 1;
                  Navigator.pop(context);
                });
                break;
              case 2:
                setState(() {
                  sekme = 2;
                  Navigator.pushNamed(context, "/draver");
                });
                break;
              case 3:
                setState(() {
                  sekme = 3;
                  Navigator.pushNamed(context, "/uye");
                });
                break;
              case 4:
                setState(() {
                  sekme = 4;
                  Navigator.pushNamed(context, "/");
                });
                break;
            }
          },
        ),
        drawer: app(),
      ),
    );
  }

  Center etk(BuildContext context, AssetImage resim, String etkid, String konum,
      String tarih, String fiyat) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5.4,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                        image:
                            DecorationImage(image: resim, fit: BoxFit.cover)),
                  ),
                  Positioned(
                    left: 150,
                    top: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 27, 231, 27),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.chair_outlined),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    etkid,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 27, 231, 27),
                      ),
                      Text(
                        konum,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        tarih,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 230, 230),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          fiyat,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 27, 231, 27),
                          ),
                        ),
                        Icon(
                          Icons.shopping_basket_outlined,
                          color: Color.fromARGB(255, 27, 231, 27),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Center kategoributon(BuildContext context, String tittle, IconData ikon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/uye");
          },
          child: Row(
            children: [
              Icon(
                ikon,
                color: Color.fromARGB(255, 27, 231, 27),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                tittle,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 0, right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: TextField(
          cursorHeight: 25,
          controller: etkinlik,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: "Etkinlik,sanatçı veya mekan arayın",
          ),
        ),
      ),
    );
  }
}
