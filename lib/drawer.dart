import 'package:flutter/material.dart';

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 237, 234, 234),
        child: ListView(children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.2,
                color: Color.fromARGB(255, 30, 240, 30),
                child: Stack(
                  children: [
                    Positioned(
                      // top: 0,
                      bottom: 0,
                      // right: 10,
                      left: 0,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromARGB(255, 237, 234, 234),
                      ),
                    ),
                    Positioned(
                      // top: 0,
                      bottom: 0,
                      // right: 10,
                      left: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            drawerbuton(context, Icons.person_add_alt_outlined,
                                "Giriş Yap"),
                            SizedBox(
                              width: 20,
                            ),
                            drawerbuton(context, Icons.login, "Üye Ol")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50, right: 60),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(
                          "assets/bubilet.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text(
                  'Trendler',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  'Konser',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Tiyatro',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Festival',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Çocuk Aktiviteleri',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Blog',
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 40,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, bottom: 10),
                child: Row(
                  children: [
                    Text("Hakkımızda"),
                    SizedBox(
                      width: 50,
                    ),
                    Text("Kullanıcı Sözleşmesi")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: Row(
                  children: [
                    Text("Gizlilik Politikası"),
                    SizedBox(
                      width: 25,
                    ),
                    Text("İletişim")
                  ],
                ),
              )
            ],
          ),
        ]));
  }

  Container drawerbuton(BuildContext context, IconData ikon, String tittle) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 253, 253, 253),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Icon(
              ikon,
              size: 35,
            ),
            Text(
              tittle,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
