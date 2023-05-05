// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamatae_application/pages/order_detail_admin.dart';

class orders extends StatefulWidget {
  orders({Key? key}) : super(key: key);

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
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
          "Orders",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderDetailPage()));
              },
              child: Container(
                width: 340,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffEDE1D7),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Order Number :",
                            style: TextStyle(
                                color: Color(0xff494036), fontSize: 20),
                          ),
                          Text(
                            "OR001",
                            style: TextStyle(
                                color: Color(0xff494036), fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Varangkana phasukdee",
                            style: TextStyle(
                                color: Color(0xff494036), fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 300,
                            height: 50,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff494036)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xffEDE1D7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Espresso",
                                  style: TextStyle(
                                      color: Color(0xff494036), fontSize: 16),
                                ),
                                Text(
                                  "x1",
                                  style: TextStyle(
                                      color: Color(0xff494036), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 340,
              height: 165,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffEDE1D7),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Order Number :",
                          style:
                              TextStyle(color: Color(0xff494036), fontSize: 20),
                        ),
                        Text(
                          "OR002",
                          style:
                              TextStyle(color: Color(0xff494036), fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Amm",
                          style:
                              TextStyle(color: Color(0xff494036), fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 300,
                          height: 70,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff494036)),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xffEDE1D7),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Espresso",
                                    style: TextStyle(
                                        color: Color(0xff494036), fontSize: 16),
                                  ),
                                  Text(
                                    "x1",
                                    style: TextStyle(
                                        color: Color(0xff494036), fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Americano",
                                    style: TextStyle(
                                        color: Color(0xff494036), fontSize: 16),
                                  ),
                                  Text(
                                    "x1",
                                    style: TextStyle(
                                        color: Color(0xff494036), fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
