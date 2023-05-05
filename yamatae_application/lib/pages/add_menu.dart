// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';

import '../models/menu_model.dart';
import '../models/menu_type_model.dart';

class AddMenuPage extends StatefulWidget {
  AddMenuPage({Key? key, required this.listMenu}) : super(key: key);

  List<Menu> listMenu;

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final getName = TextEditingController();
  final getPrice = TextEditingController();
  final getDescription = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? image;
  final formKey = GlobalKey<FormState>();
  var selectType;
  List<DropdownMenuItem<String>> menuTypeItems = [];

  Future pickImage() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    getMenuType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF494036),
        appBar: AppBar(
          title: Text(
            'Add Menu',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onTap: () => {Navigator.pop(context)},
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Builder(builder: (context) {
            return Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    image != null
                        ? Image.file(
                            image!,
                            width: 120,
                            height: 120,
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () => {pickImage()},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                          primary: Color(0xFF967259),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                      child: Text('Add Image',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 330,
                      child: TextFormField(
                        controller: getName,
                        decoration: InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.pen),
                          hintText: 'ชื่อกาแฟ',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xffBFBEBE)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "กรุณากรอกชื่อกาแฟ";
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
                      height: 100,
                      width: 330,
                      child: TextFormField(
                        controller: getPrice,
                        decoration: InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.pen),
                          hintText: 'ราคา',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xffBFBEBE)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "กรุณากรอกราคา";
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
                      height: 150,
                      width: 330,
                      child: TextFormField(
                        controller: getDescription,
                        maxLines: 4,
                        decoration: InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.pen),
                          hintText: 'คำอธิบาย',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 0.5, color: Color(0xffBFBEBE)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 110,
                      width: 330,
                      child: DropdownButtonFormField<String>(
                          hint: Text('ประเภทกาแฟ'),
                          value: selectType,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectType = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  width: 0.5, color: Color(0xffBFBEBE)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "กรุณาเลือกประเภทกาแฟ";
                            }
                            return null;
                          },
                          items: menuTypeItems),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        if (formKey.currentState!.validate()) {addMenu()}
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                          primary: Color(0xFF967259),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                      child: Text('Add Menu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23)),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }

  addMenu() async {
    String pathImage = '-';
    if (image != null) {
      pathImage = image!.path;
    }

    bool isFound = false;
    for (var item in widget.listMenu) {
      if (item.name.toLowerCase() == getName.text.toLowerCase()) {
        isFound = true;
      }
    }

    if (isFound) {
      Fluttertoast.showToast(msg: 'มีเมนูนี้อยู่แล้ว');
    } else {
      String id = "MN";
      if (widget.listMenu.isEmpty) {
        id += "00001";
      } else {
        Menu menuLast = widget.listMenu.elementAt(widget.listMenu.length - 1);
        List idSplit = menuLast.menuID.toString().split('MN');
        int idCurrent = int.parse(idSplit[1]) + 1;
        if (idCurrent.toString().length == 1) {
          id += "0000" + idCurrent.toString();
        } else if (idCurrent.toString().length.toString().length == 2) {
          id += "000" + idCurrent.toString();
        }
      }

      if (getDescription.text.isEmpty) {
        getDescription.text = '-';
      }
      var url = Uri.parse(
          "https://10.0.2.2:5001/Menu/Create?keyword1=$id&keyword2=$selectType&keyword3=${getName.text}&keyword4=${getPrice.text}&keyword5=${getDescription.text}&keyword6=$pathImage");
      await http.post(url);
      Fluttertoast.showToast(msg: 'สร้างประเภทเมนูสำเร็จ');
      Navigator.of(context).pop();
    }
  }

  getMenuType() async {
    var url = Uri.parse("https://10.0.2.2:5001/MenuType");
    var response = await http.get(url);
    List<MenuType> menuTypeList = menuTypeFromJson(response.body);
    for (var item in menuTypeList) {
      menuTypeItems.add(
        DropdownMenuItem(child: Text(item.name), value: item.id),
      );
    }
    setState(() {});
  }
}
