import 'package:flutter/material.dart';

class appbar extends StatefulWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 27, 231, 27),
      title: Container(child: Center(child: Image.asset("assets/bubilet.png"))),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, "/uye");
            });
          },
          icon: Icon(Icons.location_on),
          color: Colors.white,
          iconSize: 35,
        ),
      ],
    );
  }
}
