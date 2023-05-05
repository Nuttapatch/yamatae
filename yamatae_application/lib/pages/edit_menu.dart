// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:yamatae_application/pages/add_menu.dart';

import '../models/menu_model.dart';

class EditMenuPage extends StatefulWidget {
  EditMenuPage({Key? key}) : super(key: key);

  @override
  State<EditMenuPage> createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  List<TextEditingController> listControllerName = [];
  List<TextEditingController> listControllerPrice = [];
  List<TextEditingController> listControllerDes = [];
  List<Menu> menuList = [];
  List<DropdownMenuItem<String>> sortItems = [
    DropdownMenuItem(child: Text("เรียงราคาจากมาก-น้อย"), value: "DESC"),
    DropdownMenuItem(child: Text("เรียงราคาจากน้อย-มาก"), value: "ASC"),
  ];
  var selectSort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF494036),
      appBar: AppBar(
        title: Text(
          'Edit Menu',
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
            onTap: () async {
              final value = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddMenuPage(
                            listMenu: menuList,
                          )));
              setState(() {});
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
      body: Center(
        child: FutureBuilder(
            future: getMenuFromDB(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    DropdownButtonFormField<String>(
                        hint: Text('เรียงลำดับ'),
                        value: selectSort,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectSort = newValue!;
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
                        items: sortItems),
                    Expanded(
                      child: ListView.builder(
                          itemCount: menuList.length,
                          itemBuilder: (context, index) {
                            var file;
                            if (menuList[index].image == '-') {
                              file = ' ';
                            } else {
                              file = File(menuList[index].image);
                            }
                            listControllerName[index].text =
                                menuList[index].name;
                            listControllerPrice[index].text =
                                menuList[index].price.toString();
                            listControllerDes[index].text =
                                menuList[index].description;
                            return Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: UnconstrainedBox(
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEDE1D7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: SizedBox.fromSize(
                                              size: Size.fromRadius(35),
                                              child: file != ' '
                                                  ? Image.file(
                                                      file,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      'assets/images/img_image1.png',
                                                      fit: BoxFit.cover,
                                                    )),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 130,
                                                  height: 50,
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 5, 10, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        listControllerName[
                                                            index],
                                                  ),
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      updateMenu(
                                                          menuList[index]
                                                              .menuID,
                                                          listControllerName[
                                                                  index]
                                                              .text,
                                                          listControllerDes[
                                                                  index]
                                                              .text,
                                                          int.parse(
                                                              listControllerPrice[
                                                                      index]
                                                                  .text));
                                                    },
                                                    child: Icon(
                                                        CupertinoIcons.pen)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 30,
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 5, 10, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        listControllerPrice[
                                                            index],
                                                  ),
                                                ),
                                                Text(
                                                  'THB',
                                                  style: TextStyle(
                                                      color: Color(0xff494036),
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      updateMenu(
                                                          menuList[index]
                                                              .menuID,
                                                          listControllerName[
                                                                  index]
                                                              .text,
                                                          listControllerDes[
                                                                  index]
                                                              .text,
                                                          int.parse(
                                                              listControllerPrice[
                                                                      index]
                                                                  .text));
                                                    },
                                                    child: Icon(
                                                        CupertinoIcons.pen)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              width: 180,
                                              height: 70,
                                              child: TextFormField(
                                                maxLines: 2,
                                                controller:
                                                    listControllerDes[index],
                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                        onPressed: () {
                                                          updateMenu(
                                                              menuList[index]
                                                                  .menuID,
                                                              listControllerName[
                                                                      index]
                                                                  .text,
                                                              listControllerDes[
                                                                      index]
                                                                  .text,
                                                              int.parse(
                                                                  listControllerPrice[
                                                                          index]
                                                                      .text));
                                                        },
                                                        icon: Icon(
                                                            CupertinoIcons
                                                                .pen))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            deleteMenu(menuList[index]);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<List<Menu>> getMenuFromDB() async {
    var url;
    if (selectSort == null) {
      url = Uri.parse("https://10.0.2.2:5001/Menu");
    } else {
      url = Uri.parse("https://10.0.2.2:5001/Menu/sort?keyword=$selectSort");
    }
    var response = await http.get(url);
    menuList = menuFromJson(response.body);
    for (var i = 0; i < menuList.length; i++) {
      listControllerPrice.add(TextEditingController());
      listControllerName.add(TextEditingController());
      listControllerDes.add(TextEditingController());
    }
    return menuList;
  }

  updateMenu(String id, String newName, String newDes, int newPrice) async {
    var url = Uri.parse(
        "https://10.0.2.2:5001/Menu/update?keyword1=$id&keyword2=$newName&keyword3=$newDes&keyword4=$newPrice");
    await http.put(url);
    Fluttertoast.showToast(msg: 'อัพเดทสำเร็จ');
    setState(() {});
  }

  deleteMenu(Menu menu) async {
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
                      "https://10.0.2.2:5001/Menu/Delete?keyword=${menu.menuID}");
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
}
