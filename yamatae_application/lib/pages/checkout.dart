// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'transfer.dart';

class checkout extends StatefulWidget {
  checkout({Key? key}) : super(key: key);
  bool isChecked = false;
  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
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
          "Checkout",
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
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                              color: Color(0xff494036),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        // Icon(
                        //       Icons.,
                        //       color: Colors.black,
                        //     ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: '17/234 Pracha Chuen road Laksi 10210',
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 16),
                          errorStyle: TextStyle(fontSize: 18)),
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
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.people_alt_rounded,
                          color: Color(0xff494036),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                              color: Color(0xff494036),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Varangkana Phasukdee',
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 16),
                          errorStyle: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color(0xff494036),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Phone Number ",
                          style: TextStyle(
                              color: Color(0xff494036),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: '0917504417',
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 16),
                          errorStyle: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.note_alt_rounded,
                          color: Color(0xff494036),
                        ),
                        Text(
                          "Note ",
                          style: TextStyle(
                              color: Color(0xff494036),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'No Sugar',
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 16),
                          errorStyle: TextStyle(fontSize: 18)),
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
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffEDE1D7),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "How to pay",
                          style: TextStyle(
                              color: Color(0xff494036),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyStatefulWidget(),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "cash",
                          style: TextStyle(
                            color: Color(0xff494036),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyStatefulWidget(),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Transfer",
                          style: TextStyle(
                            color: Color(0xff494036),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: ElevatedButton(
                  onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => transfer()))
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color(0xff494036);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
