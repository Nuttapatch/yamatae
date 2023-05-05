// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'enter_details.dart';
import 'map.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final getHouseNum = TextEditingController();
  final getLaneOrVillage = TextEditingController();
  final getRoad = TextEditingController();
  final getProvince = TextEditingController();
  final getSubDistrict = TextEditingController();
  final getDistrict = TextEditingController();
  final getLatLong = TextEditingController();
  final getZipcode = TextEditingController();
  late String lat, long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onTap: () => {Navigator.pop(context)},
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 2),
                blurRadius: 3.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff494036),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 320,
                  height: 750,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/img_yamataeround.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(125, 145, 0, 0),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFEDE1D7)),
                              child: Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: Color(0xff494036),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 70,
                        width: 280,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xff494036)),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                                color: Color(0xff494036), fontSize: 20),
                            errorStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFEDE1D7),
                          ),
                          validator: (String? value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 70,
                        width: 280,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.email, color: Color(0xff494036)),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: Color(0xff494036), fontSize: 20),
                            errorStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFEDE1D7),
                          ),
                          validator: (String? value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 70,
                        width: 280,
                        child: TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.phone, color: Color(0xff494036)),
                            hintText: 'Phone',
                            hintStyle: TextStyle(
                                color: Color(0xff494036), fontSize: 20),
                            errorStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFEDE1D7),
                          ),
                          validator: (String? value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnterDetailsPage(
                                        username: usernameController.text,
                                        email: emailController.text,
                                        pass: '',
                                        phoneNum: phoneController.text,
                                        type: 'edit',
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 140,
                          width: 280,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            controller: getHouseNum,
                            decoration: InputDecoration(
                              enabled: false,
                              hintText: 'Address',
                              hintStyle: TextStyle(
                                  color: Color(0xff494036), fontSize: 20),
                              errorStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFEDE1D7),
                            ),
                            validator: (String? value) {},
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                            primary: Color(0xff494036),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),
                        child: Text('SAVE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void GetCoordMap(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectMap()),
    );

    setState(() {
      getLatLong.text = result.toString();
      List temp = result.toString().split(', ');
      lat = temp[0];
      long = temp[1];
    });
  }
}
