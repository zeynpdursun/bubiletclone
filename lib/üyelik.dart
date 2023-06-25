import 'package:bubilet/drawer.dart';
import 'package:flutter/material.dart';

class uyelik extends StatefulWidget {
  const uyelik({Key? key}) : super(key: key);

  @override
  State<uyelik> createState() => _uyelikState();
}

class _uyelikState extends State<uyelik> {
  TextEditingController kullaniciadi = TextEditingController();
  TextEditingController sifre = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController id = TextEditingController();
  bool isChecked = false;
  bool check = false;
  final ScrollController _controller = ScrollController();
  int sekme = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        body: Scrollbar(
          controller: _controller,
          child: ListView(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                          child: loginbutton(context, "HIZLI ÜYELİK", "/uye")),
                    ],
                  ),
                ),
                Scrollbar(
                  controller: _controller,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 1.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadiusDirectional.circular(16.0),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                bilgi("E-POSTA ADRESİNİZ*"),
                                textfield("E-Posta", kullaniciadi,
                                    Icons.mail_outline_outlined),
                                SizedBox(
                                  height: 15,
                                ),
                                bilgi(""),
                                textfield("", sifre, Icons.key),
                                SizedBox(
                                  height: 15,
                                ),
                                bilgi("TELEFON NUMARANIZ*"),
                                textfield(
                                    "Telefon Numaranız", tel, Icons.phone),
                                SizedBox(
                                  height: 15,
                                ),
                                bilgi("ADINIZ SOYADINIZ*"),
                                textfield("Ad Soyad Giriniz", id, Icons.person),
                                SizedBox(
                                  height: 15,
                                ),
                                checkbox_(
                                  context,
                                  isChecked,
                                  "Ön Bilgilendirme Koşullarını ve Mesafe Satış Sözleşmesini Okudum",
                                ),
                                checkbox_(context, check,
                                    "Bubilet.com.tr bültenlerine abone olmak istiyorum."),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Color.fromARGB(255, 27, 231, 27),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/uye");
                                    },
                                    child: Text(
                                      "  Üye Ol Devam Et",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
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

  Row bilgi(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }

  Row checkbox_(BuildContext context, bool deger, String text) {
    return Row(
      children: [
        Checkbox(
            checkColor: Colors.white,
            value: deger,
            onChanged: (bool? value) {
              deger = value!;
            }),
        Expanded(
          child: Text(text),
        )
      ],
    );
  }

  Row textfield(String txt, TextEditingController deger, IconData ikon) {
    return Row(
      children: [
        Container(
          child: Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              controller: deger,
              decoration: InputDecoration(
                hintText: txt,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Icon(
            ikon,
            color: Color.fromARGB(255, 122, 119, 119),
            size: 28,
          ),
        ),
      ],
    );
  }

  ElevatedButton loginbutton(
      BuildContext context, String yazi, String navigator) {
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
          yazi,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ));
  }
}
// ignor
