// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:yamatae_application/pages/admin_panel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../models/admin_model.dart';
import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  List<Admin> allAdmin = [];
  Admin adminCurrent = Admin(adminID: '', password: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF494036),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/img_yamataeround.png',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xFF9D908D)),
                        labelText: 'Username',
                        labelStyle:
                            TextStyle(color: Color(0xFF9D908D), fontSize: 20),
                        errorStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFEDE1D7),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            }),
                        prefixIcon: Icon(Icons.lock, color: Color(0xFF9D908D)),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color(0xFF9D908D), fontSize: 20),
                        errorStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFEDE1D7),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      if (formkey.currentState!.validate()) {getAdmin()}
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(110, 15, 110, 15),
                        primary: Color(0xFF967259),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                    child: Text('Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23)),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()))
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getAdmin() async {
    var url = Uri.parse("https://10.0.2.2:5001/Admin");
    var response = await http.get(url);
    allAdmin = adminFromJson(response.body);
    for (var item in allAdmin) {
      if (item.adminID == usernameController.text &&
          item.password == passwordController.text) {
        Fluttertoast.showToast(msg: "เข้าสู่ระบบสำเร็จ");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => admin()));
      } else {
        Fluttertoast.showToast(msg: "username หรือ password ไม่ถูกต้อง");
      }
    }
  }
}
