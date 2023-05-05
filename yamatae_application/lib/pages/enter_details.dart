// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'map.dart';

class EnterDetailsPage extends StatefulWidget {
  EnterDetailsPage(
      {Key? key,
      required this.username,
      required this.email,
      required this.pass,
      required this.phoneNum,
      required this.type})
      : super(key: key);

  String username, pass, email, phoneNum, type;

  @override
  State<EnterDetailsPage> createState() => _EnterDetailsPageState();
}

class _EnterDetailsPageState extends State<EnterDetailsPage> {
  final getHouseNum = TextEditingController();
  final getLaneOrVillage = TextEditingController();
  final getRoad = TextEditingController();
  final getProvince = TextEditingController();
  final getSubDistrict = TextEditingController();
  final getDistrict = TextEditingController();
  final getLatLong = TextEditingController();
  final getZipcode = TextEditingController();
  late String lat, long;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if(widget.type == 'new'){}
    else if(widget.type == 'edit'){}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF494036),
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
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Image(
                    image: AssetImage('assets/images/img_yamataeround.png'),
                    width: 160,
                    height: 160,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 55,
                    padding:
                        EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xFFEDE1D7),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'House Number',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getHouseNum,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    height: 55,
                    padding:
                        EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xFFEDE1D7),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lane/Village',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getLaneOrVillage,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    height: 55,
                    padding:
                        EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xFFEDE1D7),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Road',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getHouseNum,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    height: 55,
                    padding:
                        EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xFFEDE1D7),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Province',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getProvince,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    height: 55,
                    padding:
                        EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xFFEDE1D7),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Sub District',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getSubDistrict,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    height: 55,
                    padding:
                        EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xFFEDE1D7),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'District',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getDistrict,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    height: 55,
                    padding:
                        EdgeInsets.only(top: 4, left: 30, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xFFEDE1D7),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Zip Code',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getZipcode,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => {GetCoordMap(context)},
                    child: Container(
                      width: 300,
                      height: 55,
                      padding: EdgeInsets.only(
                          top: 4, left: 30, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFEDE1D7),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabled: false,
                            suffixIcon: Icon(Icons.map),
                            border: InputBorder.none,
                            hintText: 'Pin Location',
                            hintStyle: TextStyle(fontSize: 20),
                            errorStyle: TextStyle(fontSize: 15)),
                        style: TextStyle(fontSize: 20),
                        controller: getLatLong,
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()))
                          },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                        primary: Color(0xFF967259),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ))
                ],
              ),
            ),
          ),
        ));
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
