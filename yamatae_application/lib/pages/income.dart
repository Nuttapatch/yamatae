// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class income extends StatefulWidget {
  income({Key? key}) : super(key: key);

  @override
  State<income> createState() => _incomeState();
}

class _incomeState extends State<income> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff494036),
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onTap: () => {Navigator.pop(context)},
        ),
        title: Text(
          "Income",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
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
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(right: 20),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffEDE1D7),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "9/4/2022",
                        style:
                            TextStyle(color: Color(0xff967259), fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text("3,450 THB",
                  style: TextStyle(
                      color: Color(0xffE17529),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 110,
              ),
              Container(
                width: 390,
                height: 362,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/img_pngitem3550069.png",
                              width: 60, height: 60),
                          SizedBox(
                            width: 10,
                          ),
                          Text("150 Cups",
                              style: TextStyle(
                                color: Color(0xff494036),
                                fontSize: 30,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/img_delivery1.png",
                              width: 60, height: 60),
                          SizedBox(
                            width: 10,
                          ),
                          Text("80 Orders",
                              style: TextStyle(
                                color: Color(0xff494036),
                                fontSize: 30,
                              ))
                        ],
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
