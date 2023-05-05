// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamatae_application/pages/coffee_detail.dart';
import 'package:yamatae_application/pages/mycart.dart';
import 'package:yamatae_application/pages/profile.dart';
import 'package:yamatae_application/pages/your_order.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getSearch = TextEditingController();
  String currentMenu = 'Hot Coffee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Color(0xFFEDE1D7),
          centerTitle: true,
          title: Image.asset(
            'assets/images/img_yamataeround.png',
            width: 50,
            height: 50,
          ),
          iconTheme: IconThemeData(color: Color(0xFF494036)),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_basket_outlined),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => mycart()));
              },
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              iconSize: 30,
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF494036),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff494036),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/img_yamataeround.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Vreval',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '620107030020@dpu.ac.th',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => YourOrderPage()));
              },
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('Your Order'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                padding:
                    EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 20),
                      errorStyle: TextStyle(fontSize: 15),
                      suffixIcon: Icon(Icons.search)),
                  style: TextStyle(fontSize: 20),
                  controller: getSearch,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentMenu = "All";
                            });
                          },
                          child: currentMenu == "All"
                              ? Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.orange.shade900),
                                )
                              : Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentMenu = "Hot Coffee";
                            });
                          },
                          child: currentMenu == "Hot Coffee"
                              ? Text(
                                  'Hot Coffee',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.orange.shade900),
                                )
                              : Text(
                                  'Hot Coffee',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentMenu = "Cold Coffee";
                            });
                          },
                          child: currentMenu == "Cold Coffee"
                              ? Text(
                                  'Cold Coffee',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.orange.shade900),
                                )
                              : Text(
                                  'Cold Coffee',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentMenu = "Milk";
                            });
                          },
                          child: currentMenu == "Milk"
                              ? Text(
                                  'Milk',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.orange.shade900),
                                )
                              : Text(
                                  'Milk',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentMenu = "Tea";
                            });
                          },
                          child: currentMenu == "Tea"
                              ? Text(
                                  'Tea',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.orange.shade900),
                                )
                              : Text(
                                  'Tea',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: getMenu(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Reccommed',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  children: getReccommend(),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  List<Widget> getReccommend() {
    List<Widget> list = [];
    for (var i = 0; i < 2; i++) {
      list.add(GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CoffeeDetailPage()));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          height: 100,
          width: 350,
          decoration: BoxDecoration(
              color: Color(0xFFEDE1D7),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(55), // Image radius
                    child: Image.asset(
                      'assets/images/img_image1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Espresso',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '30 THB',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ));

      list.add(SizedBox(
        height: 15,
      ));
    }

    return list;
  }

  List<Widget> getMenu() {
    List<Widget> list = [];
    for (var i = 0; i < 2; i++) {
      list.add(GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CoffeeDetailPage()));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          height: 250,
          width: 200,
          decoration: BoxDecoration(
              color: Color(0xFFEDE1D7),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(55), // Image radius
                  child: Image.asset(
                    'assets/images/img_image1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Espresso',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '30 THB',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ));

      list.add(SizedBox(
        width: 15,
      ));
    }
    return list;
  }
}
