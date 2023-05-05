// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeDetailPage extends StatefulWidget {
  CoffeeDetailPage({Key? key}) : super(key: key);

  @override
  State<CoffeeDetailPage> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfffe9f60),
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onTap: () => {Navigator.pop(context)},
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
            child: Stack(children: [
          Container(
            width: 500,
            height: 350,
            child: Image.asset(
              'assets/images/img_image1.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            margin: EdgeInsets.only(top: 280),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'coffee',
                      style: TextStyle(fontSize: 40, color: Color(0xff494036)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('30',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffE17529),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    Text("THB",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffE17529)))
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  "An Italian style of coffee that's brewed very strong and served in a small cup.",
                  style: TextStyle(fontSize: 15, color: Color(0xff9D908D)),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => subAmount(),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(0, 7, 0, 5),
                        primary: Color(0xFFEDE1D7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        '-',
                        style: TextStyle(
                            color: Color(0xff494036),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    amount.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff494036)),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () => addAmount(),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(0, 7, 0, 5),
                        primary: Color(0xFFEDE1D7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: Color(0xff494036),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () => {}, //addToCart(),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                    primary: Color(0xFF967259),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
            ]),
          )
        ])));
  }

  subAmount() {
    if (amount > 1) {
      setState(() {
        amount -= 1;
      });
    }
  }

  addAmount() {
    setState(() {
      amount += 1;
    });
  }
}
