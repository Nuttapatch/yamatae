// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'complete.dart';

class transfer extends StatefulWidget {
  transfer({Key? key}) : super(key: key);

  @override
  State<transfer> createState() => _transferState();
}

class _transferState extends State<transfer> {
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
          "Transfer",
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
            Container(
              width: 350,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffEDE1D7),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  children: [
                    Image.asset("assets/images/img_logo1.png",
                        width: 60, height: 60),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Kasikorn Bank",
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
                              "056-814-5771",
                              style: TextStyle(
                                color: Color(0xff494036),
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.copy_all_rounded,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 350,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffEDE1D7),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/img_qrpromptpay1.png",
                      width: 250, height: 250),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "yamatae Coffe Shop",
                    style: TextStyle(
                      color: Color(0xff494036),
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffEDE1D7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: ElevatedButton(
                    onPressed: () => {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Delivery()))
                        },
                    style: ElevatedButton.styleFrom(
                      // padding: EdgeInsets.fromLTRB(110, 5, 110, 5),
                      primary: Color(0xffE17529),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'อัพโหลดสลิป',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: ElevatedButton(
                  onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => complete()))
                      },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(110, 5, 110, 5),
                    primary: Color(0xff967259),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
