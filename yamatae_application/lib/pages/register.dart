// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamatae_application/pages/enter_details.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  final getUsername = TextEditingController();
  final getEmail = TextEditingController();
  final getPhoneNum = TextEditingController();
  final getPassword = TextEditingController();
  final getConPass = TextEditingController();
  final getName = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                    width: 200,
                    height: 200,
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
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getUsername,
                      validator: (value) {
                        if (value == "") {
                          return "ต้องกรอก Username";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getEmail,
                      validator: (value) {},
                    ),
                  ),
                  SizedBox(height: 20),
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
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getPhoneNum,
                      validator: (value) {},
                    ),
                  ),
                  SizedBox(height: 20),
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
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name Surname',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15)),
                      style: TextStyle(fontSize: 20),
                      controller: getName,
                      validator: (value) {},
                    ),
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
                        obscureText: _obscureText1,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15),
                          suffixIcon: IconButton(
                              icon: Icon(_obscureText1
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              }),
                        ),
                        style: TextStyle(fontSize: 20),
                        controller: getPassword,
                        validator: (value) {
                          if (value == "") {
                            return "ต้องกรอก Password";
                          } else if (value!.length < 6) {
                            return "Password ต้องมีอย่างน้อย 6 ตัว";
                          } else if (value != getConPass.text) {
                            return "Password กับ Confirm Password ต้องตรงกัน";
                          }
                          return null;
                        }),
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
                        obscureText: _obscureText2,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(fontSize: 20),
                          errorStyle: TextStyle(fontSize: 15),
                          suffixIcon: IconButton(
                              icon: Icon(_obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              }),
                        ),
                        style: TextStyle(fontSize: 20),
                        controller: getConPass,
                        validator: (value) {
                          if (value == "") {
                            return "ต้องกรอก Confirm Password";
                          } else if (value!.length < 6) {
                            return "Confirm Password ต้องมีอย่างน้อย 6 ตัว";
                          } else if (value != getPassword.text) {
                            return "Password กับ Confirm Password ต้องตรงกัน";
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EnterDetailsPage(
                                          username: getUsername.text,
                                          email: getEmail.text,
                                          pass: getPassword.text,
                                          phoneNum: getPhoneNum.text,
                                          type: 'new',
                                        )))
                          },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(115, 10, 115, 10),
                        primary: Color(0xFF967259),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
