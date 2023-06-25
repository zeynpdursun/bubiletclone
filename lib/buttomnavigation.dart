import 'package:bubilet/main.dart';
import 'package:bubilet/trend.dart';
import 'package:flutter/material.dart';

class buttom extends StatefulWidget {
  const buttom({Key? key}) : super(key: key);

  @override
  State<buttom> createState() => _buttomState();
}

class _buttomState extends State<buttom> {
  int sekme = 0;
  final tabs = [trendler(), uygulama()];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app),
          label: "",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(icon: Icon(Icons.window_rounded), label: ""),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.share_outlined,
          ),
          label: "",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "",
          backgroundColor: Colors.green,
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
              Navigator.pushNamed(context, "/uye");
            });
            break;
          case 2:
            setState(() {
              sekme = 2;
              Navigator.pushNamed(context, "");
            });
            break;
          case 3:
            setState(() {
              sekme = 3;
              Navigator.pushNamed(context, "");
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
    );
  }
}
