import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamatae_application/pages/home.dart';

class complete extends StatefulWidget {
  complete({Key? key}) : super(key: key);

  @override
  State<complete> createState() => _completeState();
}

class _completeState extends State<complete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff494036),
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Text(
            "Complete!",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "เราจะเตรียมออเดอร์",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "แล้วนำส่งให้คุณ",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Column(children: <Widget>[
            Image.asset("assets/images/img_delivery1.png",
                width: 300, height: 300),
          ]),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Order Number : ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " OR001",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 0)),
          ElevatedButton(
              onPressed: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()))
                  },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(110, 5, 110, 5),
                primary: Color(0xff967259),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Close',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
