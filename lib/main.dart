import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'dart:ffi';
import 'package:get/get.dart';
import 'package:postest7_2009106011_egasulfika/keranjang_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    start();
  }

  start() {
    var duration = const Duration(seconds: 10);
    return Timer(duration, () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Hal2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

class Hal2 extends StatelessWidget {
  const Hal2({Key? key}) : super(key: key);

  Future<dynamic> CustomAlert(BuildContext context, String pesan) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Furniture Store BY EGA SULFIKA"),
            actions: [
              Column(
                children: [
                  Text(
                    pesan,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "++++++++++",
                    style: TextStyle(fontSize: 50),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LandingPage()));
                      },
                      child: const Text(
                        "Lanjutkan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(89, 87, 138, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MENU AWAL")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CustomAlert(context, "Selamat Datang");
          },
          child: Text("SELAMAT BERBELANJA"),
        ),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 217, 236),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.089),
        title: Text(
          'FURNITURE STORE by Ega Sulfika',
          style: TextStyle(
              color: Color.fromRGBO(255, 254, 254, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: TextField(
                                cursorColor: Color.fromARGB(255, 111, 179, 235),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.blue),
                                ))),
                      ],
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: tinggi / 25,
                        width: lebar / 6,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5),
                              bottomEnd: Radius.circular(5),
                              bottomStart: Radius.circular(5),
                            )),
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: tinggi / 25,
                        width: lebar / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5),
                              bottomEnd: Radius.circular(5),
                              bottomStart: Radius.circular(5),
                            )),
                        child: Text(
                          "Sofa",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: tinggi / 25,
                        width: lebar / 6,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5),
                              bottomEnd: Radius.circular(5),
                              bottomStart: Radius.circular(5),
                            )),
                        child: Text(
                          "Kursi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: tinggi / 25,
                        width: lebar / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5),
                              bottomEnd: Radius.circular(5),
                              bottomStart: Radius.circular(5),
                            )),
                        child: Text(
                          "Lemari",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: tinggi / 25,
                        width: lebar / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5),
                              bottomEnd: Radius.circular(5),
                              bottomStart: Radius.circular(5),
                            )),
                        child: Text(
                          "Meja",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        alignment: Alignment.center,
                        height: tinggi / 25,
                        width: lebar / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5),
                              bottomEnd: Radius.circular(5),
                              bottomStart: Radius.circular(5),
                            )),
                        child: Text(
                          "Karpet",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        alignment: Alignment.center,
                        height: tinggi / 25,
                        width: lebar / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5),
                              bottomEnd: Radius.circular(5),
                              bottomStart: Radius.circular(5),
                            )),
                        child: Text(
                          "Pintu",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Stack(
                  children: [
                    Container(
                      width: lebar - 32,
                      height: tinggi / 5,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: tinggi / 5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Item_1.png"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 12),
                      child: Container(
                        child: Text(
                          "Slide Chair",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 12),
                      child: Container(
                        child: Text(
                          "Classic Leather",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 40),
                      child: Container(
                        child: Text(
                          "Rp. 500.000",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return DetailChairPage();
                          }),
                        );
                      },
                      child: Text(
                        "Click Here",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Stack(
                  children: [
                    Container(
                      width: lebar - 32,
                      height: tinggi / 5,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Container(
                        alignment: Alignment.topRight,
                        height: tinggi / 5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Item_2.png"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 12),
                      child: Container(
                        child: Text(
                          "Poppy Plastic",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 12),
                      child: Container(
                        child: Text(
                          "Tub Chair",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 40),
                      child: Container(
                        child: Text(
                          "Rp. 1.000.000",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return DetailTubPage();
                          }),
                        );
                      },
                      child: Text(
                        "Click Here",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Stack(
                  children: [
                    Container(
                      width: lebar - 32,
                      height: tinggi / 5,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Container(
                        alignment: Alignment.topRight,
                        height: tinggi / 5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Item_3.png"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 12),
                      child: Container(
                        child: Text(
                          "Bar Stool",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 12),
                      child: Container(
                        child: Text(
                          "Chair",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 40),
                      child: Container(
                        child: Text(
                          "Rp. 2.000.000",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return DetailBarPage();
                          }),
                        );
                      },
                      child: Text(
                        "Click Here",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return MainPage();
                    }),
                  );
                },
                child: Text(
                  "PROFILE",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailChairPage extends StatelessWidget {
  const DetailChairPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 163, 180),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "SLIDE CHAIR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Image.asset("assets/Item_1.png")),
                    ],
                  )),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 163, 180),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 1000,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text(
                    'Slide Chair Merupakan kursi yang sangat nyaman digunakan, seperti sebuah sofa',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FormPage()),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99))),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 163, 180),
                        borderRadius: BorderRadius.circular(99)),
                    child: Container(
                      width: 230,
                      height: 60,
                      alignment: Alignment.center,
                      child: const Text(
                        'Add to chart',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DetailTubPage extends StatelessWidget {
  const DetailTubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 163, 180),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "POPPY PLASTIC",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Image.asset("assets/Item_2.png")),
                    ],
                  )),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 163, 180),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 1000,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text(
                    'Poppy Plastic Merupakan kursi yang sangat nyaman digunakan, seperti sebuah sofa dengan tampilan yang elegan',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FormPage()),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99))),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 163, 180),
                        borderRadius: BorderRadius.circular(99)),
                    child: Container(
                      width: 230,
                      height: 60,
                      alignment: Alignment.center,
                      child: const Text(
                        'Add to chart',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DetailBarPage extends StatelessWidget {
  const DetailBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 163, 180),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "BAR STOOL",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Image.asset("assets/Item_3.png")),
                    ],
                  )),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 163, 180),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 1000,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text(
                    'Bar Stool Chair Merupakan kursi yang sangat nyaman digunakan, seperti sebuah sofa dengan tampilan kursi yang praktis',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FormPage()),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99))),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 163, 180),
                        borderRadius: BorderRadius.circular(99)),
                    child: Container(
                      width: 230,
                      height: 60,
                      alignment: Alignment.center,
                      child: const Text(
                        'Add to chart',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  KeranjangController keranjangController = Get.put(KeranjangController());
  MainPage({Key? key}) : super(key: key);

  final krj = [
    Keranjang(),
    Container(color: Colors.orange),
    Container(color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        backgroundColor: Colors.blue,
      ),
      body: Obx(
        () => IndexedStack(
          index: keranjangController.selIndex.value,
          children: krj,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            keranjangController.changeIndex(index);
          },
          currentIndex: keranjangController.selIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class Keranjang extends StatelessWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Item_5.png"),
              ),
            ),
          ),
          Text(
            "KERANJANG BELANJAAN",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          Text(
            "isikan data anda dengan benar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              decoration: TextDecoration.underline,
              color: Colors.blue,
            ),
          ),
          MyButton()
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 55,
      margin: EdgeInsets.only(top: 0),
      alignment: Alignment.center,
      child: (ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return FormPage();
              }),
            );
          },
          child: Text("Check Out"))),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

enum Furniture { unknown, sofa, kursi, lemari, meja, karpet }

class _FormPageState extends State<FormPage> {
  final namaLengkapCtrl = TextEditingController();
  final alamatLengkapCtrl = TextEditingController();
  final noHpCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final kodePosCtrl = TextEditingController();
  final pesananCtrl = TextEditingController();
  final hargaCtrl = TextEditingController();
  final updatenamaLengkapCtrl = TextEditingController();
  final updatealamatLengkapCtrl = TextEditingController();
  final updatenoHpCtrl = TextEditingController();
  final updateemailCtrl = TextEditingController();
  final updatekodePosCtrl = TextEditingController();
  final updatepesananCtrl = TextEditingController();
  final updatehargaCtrl = TextEditingController();
  Furniture furniture = Furniture.unknown;

  String namaLengkap = "",
      alamatLengkap = '',
      noHp = '',
      email = '',
      kodePos = '',
      pesanan = '',
      harga = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namaLengkapCtrl.dispose();
    alamatLengkapCtrl.dispose();
    noHpCtrl.dispose();
    emailCtrl.dispose();
    kodePosCtrl.dispose();
    pesananCtrl.dispose();
    hargaCtrl.dispose();
    super.dispose();
  }

  String getFurniture(Furniture? value) {
    if (value == Furniture.sofa) {
      return "Sofa";
    } else if (value == Furniture.kursi) {
      return "Kursi";
    } else if (value == Furniture.lemari) {
      return "Lemari";
    } else if (value == Furniture.meja) {
      return "Meja";
    } else if (value == Furniture.karpet) {
      return "Karpet";
    }
    return "Tidak Ada Pilihan Furniture";
  }

  Future<dynamic> CustomAlert(BuildContext context, String pesan, id) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pesan),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: [
            TextField(
              maxLines: 1,
              controller: updatenamaLengkapCtrl,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                labelText: "Nama Lengkap",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 1,
              controller: updatealamatLengkapCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Alamat Lengkap"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: updatenoHpCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "No HP/Whatshaap"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: updateemailCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Email"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: updatekodePosCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Kode POS"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: updatepesananCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Pesanan Anda",
                  labelText: "Pesanan Anda"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: updatehargaCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Harga Furniture Anda",
                  labelText: "Harga Pesanan Anda"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Cancel")
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      id.update({
                        'namaLengkap': updatenamaLengkapCtrl.text,
                        'alamatLengkap': updatealamatLengkapCtrl.text,
                        'noHp': updatenoHpCtrl.text,
                        'email': updateemailCtrl.text,
                        'kodePos': updatekodePosCtrl.text,
                        'pesanan': updatepesananCtrl.text,
                        'harga': updatehargaCtrl.text,
                      });
                      Get.back();
                    },
                    child: Text("Submit")
                  ),
                ],
              ),
            ),
          ],
        );
      });
  }

  Widget cardPesanan(namaLengkap,alamatLengkap,noHp,email,kodePos,pesanan,harga,furniture,id) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                " Pesanan Anda:",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 111, 133),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 111, 133),
                  ),
                  child: Text(
                    '\t\t\t\t\tAtas Nama\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $namaLengkap',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 111, 133),
                  ),
                  child: Text(
                    '\t\t\t\t\tAlamat\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $alamatLengkap',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 111, 133),
                  ),
                  child: Text(
                    '\t\t\t\t\tNO HP \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $noHp',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 111, 133),
                  ),
                  child: Text(
                    '\t\t\t\t\tEmail\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $email',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 111, 133),
                  ),
                  child: Text(
                    '\t\t\t\t\tKode POS\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $kodePos',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                ' Jenis Furniture\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t=  $furniture',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 111, 133),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 0),
              Text(
                ' Pesanan Anda \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t=  $pesanan ',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 111, 133),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 111, 133),
                  ),
                  child: Text(
                    ' TOTAL HARGA\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t= $harga',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                      barrierDismissible: false,
                      title: "KONFIRMASI",
                      middleText: "Data akan Dihapus. Lanjutkan?",
                      cancelTextColor: Colors.red,
                      cancel: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Batal"),
                      ),
                      confirmTextColor: Colors.blue,
                      confirm: ElevatedButton(
                        onPressed: () {
                          id.delete();
                          Get.back();
                        },
                        child: Text("Lanjut"),
                      ),
                    );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 17, 0),
                      ),
                      child: Icon(Icons.delete),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomAlert(context, "Form Update" , id);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 8),
                      ),
                      child: Icon(Icons.border_color_outlined),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference dataPesanan = firestore.collection("dataPesanan");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 241, 247),
      appBar: AppBar(
        title: const Text(
          'PENAGIHAN & PENGIRIMAN',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 0, 111, 133)),
        ),
      ),
      body: ListView(
        children: [
          Column(children: [
            const SizedBox(height: 10),
            Text(
              'Pilih Jenis Furniture Anda',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Row(children: [
              Expanded(
                child: ListTile(
                  title: const Text("Sofa"),
                  leading: Radio(
                    groupValue: furniture,
                    value: Furniture.sofa,
                    // Tanda ? pada akhir tipe data menandakan nullable.
                    // Flutter by design tidak memperbolehkan variable kosong.
                    // Contoh:
                    // String nama; <- Error
                    // String? nama; <- Tidak error;
                    onChanged: (Furniture? value) {
                      setState(() {
                        // Di beri tanda seru karena variable gender bertipe Gender
                        // sedangkan value bertipe Gender? jadinya bentrok.
                        // Solusinya ditambah tanda ! diakhir variable yang bertipe Gender?
                        // Jika kalian tidak percaya, cukup hapus tanda seru di bawah,
                        // lalu QuickFix nilai value.
                        furniture = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Kursi"),
                  leading: Radio(
                    groupValue: furniture,
                    value: Furniture.kursi,
                    onChanged: (Furniture? value) {
                      setState(() {
                        furniture = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Meja"),
                  leading: Radio(
                    groupValue: furniture,
                    value: Furniture.meja,
                    onChanged: (Furniture? value) {
                      setState(() {
                        furniture = value!;
                      });
                    },
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 10), // Margin Bohongan
            TextField(
              maxLines: 1,
              controller: namaLengkapCtrl,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                labelText: "Nama Lengkap",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 1,
              controller: alamatLengkapCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Alamat Lengkap"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: noHpCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "No HP/Whatshaap"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: emailCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Email"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: kodePosCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Kode POS"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: pesananCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Pesanan Anda",
                  labelText: "Pesanan Anda"),
            ),
            const SizedBox(height: 10), // Margin Bohongan
            TextFormField(
              maxLines: 1,
              controller: hargaCtrl,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Harga Furniture Anda",
                  labelText: "Harga Pesanan Anda"),
            ),
          ]),
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                barrierDismissible: false,
                title: "KONFIRMASI",
                middleText: "Lanjutkan?",
                cancelTextColor: Colors.red,
                cancel: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Batal"),
                ),
                confirmTextColor: Colors.blue,
                confirm: ElevatedButton(
                  onPressed: () {
                    dataPesanan.add({
                      'namaLengkap': namaLengkapCtrl.text,
                      'alamatLengkap': alamatLengkapCtrl.text,
                      'noHp': noHpCtrl.text,
                      'email': emailCtrl.text,
                      'kodePos': kodePosCtrl.text,
                      'pesanan': pesananCtrl.text,
                      'harga': hargaCtrl.text,
                      'furniture': getFurniture(furniture),
                    });
                    Get.back();
                  },
                  child: Text("Lanjut"),
                ),
              );
            },
            child: const Text("Konfirmasi"),
          ),
          const SizedBox(height: 20),
          Text(
            "RIWAYAT PESANAN",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 111, 133),
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: dataPesanan.snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => cardPesanan(
                              e.get('namaLengkap'),
                              e.get('alamatLengkap'),
                              e.get('noHp'),
                              e.get('email'),
                              e.get('kodePos'),
                              e.get('pesanan'),
                              e.get('harga'),
                              e.get('furniture'),
                              dataPesanan.doc(e.id),
                              ),
                          )
                          .toList(),
                    )
                  : Text('Loading...');
            },
          ),
          const SizedBox(height: 20),
          Text(
            'EGA SULFIKA',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 111, 133),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
