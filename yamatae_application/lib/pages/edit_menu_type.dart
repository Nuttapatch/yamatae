// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yamatae_application/models/menu_type_model.dart';
import 'package:http/http.dart' as http;

class EditMenuType extends StatefulWidget {
  EditMenuType({Key? key}) : super(key: key);

  @override
  State<EditMenuType> createState() => _EditMenuTypeState();
}

class _EditMenuTypeState extends State<EditMenuType> {
  final getTypeName = TextEditingController();
  List<MenuType> menuTypeList = [];
  List listController = [];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF494036),
      appBar: AppBar(
        title: Text(
          'Edit Menu Type',
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
        actions: [
          GestureDetector(
            onTap: () {
              addMenuType();
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF967259)),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: FutureBuilder(
          future: getMenuType(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: menuTypeList.length,
                itemBuilder: (context, index) {
                  listController[index].text = menuTypeList[index].name;
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 120,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color(0xFFEDE1D7),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 30,
                                      padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 25),
                                        controller: listController[index],
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          updateMenuType(menuTypeList[index].id,
                                              listController[index].text);
                                        },
                                        child: Icon(CupertinoIcons.pen)),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                deleteMenuType(menuTypeList[index]);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  addMenuType() {
    getTypeName.clear();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'เพิ่มประเภทเมนู',
              style: TextStyle(fontSize: 30),
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: ListBody(
                  children: [
                    Form(
                      key: formKey,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 80,
                        width: 330,
                        child: TextFormField(
                          controller: getTypeName,
                          decoration: InputDecoration(
                            suffixIcon: Icon(CupertinoIcons.pen),
                            hintText: 'ชื่อประเภท',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 15),
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
                              return "กรุณากรอกชื่อประเภทเมนู";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    String id = 'TP';
                    if (menuTypeList.isEmpty) {
                      id += "00001";
                    } else {
                      MenuType menuTypeLast =
                          menuTypeList.elementAt(menuTypeList.length - 1);
                      List idSplit = menuTypeLast.id.toString().split('TP');
                      int idCurrent = int.parse(idSplit[1]) + 1;
                      if (idCurrent.toString().length == 1) {
                        id += "0000" + idCurrent.toString();
                      } else if (idCurrent
                              .toString()
                              .length
                              .toString()
                              .length ==
                          2) {
                        id += "000" + idCurrent.toString();
                      }
                    }
                    createMenuType(MenuType(id: id, name: getTypeName.text));
                    Navigator.of(context).pop();
                  }
                },
              ),
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        });
  }

  Future<List<MenuType>> getMenuType() async {
    var url = Uri.parse("https://10.0.2.2:5001/MenuType");
    var response = await http.get(url);
    menuTypeList = menuTypeFromJson(response.body);
    for (var i = 0; i < menuTypeList.length; i++) {
      listController.add(TextEditingController());
    }
    return menuTypeList;
  }

  deleteMenuType(MenuType menuType) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'ยืนยันที่จะลบหรือไม่?',
              style: TextStyle(fontSize: 30),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                onPressed: () async {
                  var url = Uri.parse(
                      "https://10.0.2.2:5001/MenuType/Delete?keyword=${menuType.id}");
                  await http.delete(url);
                  Fluttertoast.showToast(msg: 'ลบสำเร็จ');
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        });
  }

  createMenuType(MenuType menuType) async {
    bool isFound = false;
    for (var item in menuTypeList) {
      if (item.name.toLowerCase() == menuType.name.toLowerCase()) {
        isFound = true;
      }
    }

    if (isFound) {
      Fluttertoast.showToast(msg: 'มีประเภทเมนูนี้อยู่แล้ว');
    } else {
      var url = Uri.parse(
          "https://10.0.2.2:5001/MenuType/Create?keyword1=${menuType.id}&keyword2=${menuType.name}");
      await http.post(url);
      Fluttertoast.showToast(msg: 'สร้างประเภทเมนูสำเร็จ');
      setState(() {});
    }
  }

  updateMenuType(String id, String newName) async {
    var url = Uri.parse(
        "https://10.0.2.2:5001/MenuType/update?keyword1=$id&keyword2=$newName");
    await http.put(url);
    Fluttertoast.showToast(msg: 'อัพเดทสำเร็จ');
    setState(() {});
  }
}
