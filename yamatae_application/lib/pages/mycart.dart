// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkout.dart';

class mycart extends StatefulWidget {
  mycart({Key? key}) : super(key: key);

  @override
  State<mycart> createState() => _mycartState();
}

class _mycartState extends State<mycart> {
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
          "My Cart",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding:EdgeInsets.fromLTRB(0, 120, 0,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Container(
                width: 350,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffEDE1D7),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              "assets/images/img_image1.png",
                              width: 60,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Espresso",
                                style: TextStyle(
                                  color: Color(0xff494036),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "30 THB",
                                    style: TextStyle(
                                      color: Color(0xff494036),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: ElevatedButton(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Color(0xff494036),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff967259),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Color(0xff494036),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: ElevatedButton(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Color(0xff494036),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff967259),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 390,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                color: Color(0xff494036),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "30 THB",
                            style: TextStyle(
                                color: Color(0xffE17529),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: ElevatedButton(
                      onPressed: () => {
                             
                 Navigator.push(context,
                              MaterialPageRoute(builder: (context) => checkout()))
               },
                         
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(110, 5, 110, 5),
                        primary: Color(0xff967259),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                )  ,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
