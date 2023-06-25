import 'package:bubilet/drawer.dart';
import 'package:bubilet/konum.dart';
import 'package:bubilet/trend.dart';
import 'package:flutter/material.dart';

import 'üyelik.dart';

void main() {
  runApp(const bubilet());
}

class bubilet extends StatefulWidget {
  const bubilet({Key? key}) : super(key: key);

  @override
  State<bubilet> createState() => _bubiletState();
}

class _bubiletState extends State<bubilet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => uygulama(),
        "/uye": (context) => uyelik(),
        "/trend": (context) => trendler(),
        "/draver": (context) => app(),
        "/konum": (context) => konum(),
      },
    );
  }
}

class uygulama extends StatefulWidget {
  const uygulama({Key? key}) : super(key: key);

  @override
  State<uygulama> createState() => _uygulamaState();
}

class _uygulamaState extends State<uygulama> {
  TextEditingController isim = TextEditingController();
  int sekme = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 216, 230, 223),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 231, 27),
        title: Image.asset("assets/bubilet.png"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "/konum");
              });
            },
            icon: Icon(Icons.location_on),
            color: Colors.white,
            iconSize: 30,
          )
        ],
      ),
      body: Center(
        child: Scrollbar(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: loginbutton(context, "GİRİŞ YAP", "/"),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: loginbutton(context, "HIZLI ÜYELİK", "/uye"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.circular(32.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Hızlı Giriş",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          )),
                      Text("Telefon numaranızı girin ve devam edin",
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Telefon Numaranız"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: isim,
                          decoration: InputDecoration(
                            hintText: " ",
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(25)),
                              backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 27, 231, 27),
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {
                            Navigator.pushNamed(context, "");
                          },
                          child: Text(
                            " DEVAM",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text("veya"),
                      ElevatedButton.icon(
                          icon: Icon(
                            Icons.mail_outline_outlined,
                            color: Colors.black,
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(25)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "");
                          },
                          label: Text(
                            " E-Posta ile devam et",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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
          BottomNavigationBarItem(icon: Icon(Icons.window_rounded), label: ""),
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
    ));
  }

  ElevatedButton loginbutton(
      BuildContext context, String text, String navigator) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(25)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, navigator);
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ));
  }
}
