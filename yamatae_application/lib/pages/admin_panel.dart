// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamatae_application/pages/edit_menu.dart';
import 'package:yamatae_application/pages/edit_menu_type.dart';
import 'package:yamatae_application/pages/login.dart';
import 'cancel_request.dart';
import 'income.dart';
import 'orders.dart';

class admin extends StatefulWidget {
  admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff494036),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Admin Panel",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => orders()));
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(right: 20),
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffEDE1D7),
                  ),
                  child: Text(
                    "Orders",
                    style: TextStyle(color: Color(0xff494036), fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => income()));
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(right: 20),
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffEDE1D7),
                  ),
                  child: Text(
                    "Income",
                    style: TextStyle(color: Color(0xff494036), fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditMenuPage()));
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(right: 20),
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffEDE1D7),
                  ),
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Color(0xff494036), fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditMenuType()));
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(right: 20),
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffEDE1D7),
                  ),
                  child: Text(
                    "Menu Type",
                    style: TextStyle(color: Color(0xff494036), fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => cancel()));
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(right: 20),
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffEDE1D7),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cancel",
                        style:
                            TextStyle(color: Color(0xff494036), fontSize: 40),
                      ),
                      Text(
                        "Request",
                        style:
                            TextStyle(color: Color(0xff494036), fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
