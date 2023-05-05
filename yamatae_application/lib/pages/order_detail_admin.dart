// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  //var firebaseUser = FirebaseAuth.instance.currentUser;
  var name, address, tel, more, payment, total, orderNum, docId;
  List<String> orders = [];
  bool isLoaded = false, isFound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF494036),
        appBar: AppBar(
          title: Text(
            'Order Detail',
            style: TextStyle(
              fontSize: 30,
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
          child: createWidget(),
          // child: isLoaded == true
          //     ? createWidget()
          //     : Center(
          //         child: CircularProgressIndicator(),
          //       )),
        ));
  }

  Widget createWidget() {
    // if (isFound) {
    //   return Column(
    //     children: [
    //       Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
    //       Image.asset(
    //         'asset/images/onlieDeli_icon.png',
    //         width: 150,
    //         height: 180,
    //       ),
    //       Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
    //       Text(
    //         'คำสั่งซื้อหมายเลข : $orderNum',
    //         style: TextStyle(
    //             fontSize: 27,
    //             fontWeight: FontWeight.bold,
    //             color: Color(0xFFB4D3AA)),
    //       ),
    //       Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
    //       Container(
    //         padding: EdgeInsets.all(20),
    //         margin: EdgeInsets.symmetric(horizontal: 20.0),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //             color: Color(0xFFFFD9BF)),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('ชื่อลูกค้า : $name', style: TextStyle(fontSize: 25)),
    //             Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
    //             Text('เบอร์โทรศัพท์ : $tel', style: TextStyle(fontSize: 25)),
    //             Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
    //             Text('ที่อยู่ : $address', style: TextStyle(fontSize: 25)),
    //             Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
    //             Text('รายการที่สั่ง :', style: TextStyle(fontSize: 25)),
    //             Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
    //             Container(
    //               padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.all(Radius.circular(5)),
    //                 color: Colors.white,
    //               ),
    //               child: ListView(
    //                 shrinkWrap: true,
    //                 children: createOrdersWidgets(),
    //               ),
    //             ),
    //             Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
    //             Text('เพิ่มเติม : $more', style: TextStyle(fontSize: 25)),
    //             Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
    //             Text('การชำระเงิน : $payment', style: TextStyle(fontSize: 25)),
    //             Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Text(total.toString(),
    //                     style: TextStyle(fontSize: 30, color: Colors.red)),
    //                 Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
    //                 Text('บาท', style: TextStyle(fontSize: 30)),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //       Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
    //       ElevatedButton(
    //         onPressed: () => confirmAlert(),
    //         child: Text(
    //           'ยกเลิก',
    //           style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    //         ),
    //         style: ElevatedButton.styleFrom(
    //           padding: EdgeInsets.fromLTRB(140, 10, 140, 10),
    //           primary: Colors.red.shade600,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10.0),
    //           ),
    //         ),
    //       )
    //     ],
    //   );
    // } else {
    //   return Center(
    //     child: Column(
    //       children: [
    //         Padding(padding: EdgeInsets.fromLTRB(0, 250, 0, 0)),
    //         Text(
    //           'คุณยังไม่ได้ทำการสั่งซื้อ',
    //           style: TextStyle(fontSize: 40, color: Colors.grey.shade600),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return Column(
      children: [
        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
        Image.asset(
          'assets/images/img_delivery1.png',
          width: 150,
          height: 150,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Order Number : OR00001',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ชื่อลูกค้า : Varangkana Phasukdee',
                  style: TextStyle(fontSize: 18)),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Text('เบอร์โทรศัพท์ : 0917504417',
                  style: TextStyle(fontSize: 18)),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Text('ที่อยู่ : 7/9 หมู่5 ลาดหลุมแก้ว ปทุมธานี 12140',
                  style: TextStyle(fontSize: 18)),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Text('รายการที่สั่ง :', style: TextStyle(fontSize: 15)),
              Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color(0xFFEDE1D7),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Espresso',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'x1',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Americano',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'x1',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Text('เพิ่มเติม : -', style: TextStyle(fontSize: 15)),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Text('การชำระเงิน : โอนเงิน', style: TextStyle(fontSize: 15)),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('150',
                      style: TextStyle(fontSize: 25, color: Color(0xffE17529))),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                  Text('บาท',
                      style: TextStyle(fontSize: 25, color: Color(0xffE17529))),
                ],
              )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
        ElevatedButton(
          onPressed: () => confirmAlert(),
          child: Text(
            'Deliver',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(125, 10, 125, 10),
            primary: Color(0xffE17529),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> createOrdersWidgets() {
    return orders
        .map((item) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ))
        .toList();
  }

  // CheckOrder() async {
  //   var collection = FirebaseFirestore.instance.collection('Delivery');
  //   var querySnapshot = await collection.get();
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.data();
  //     if (data['name'] == firebaseUser!.displayName) {
  //       docId = queryDocumentSnapshot.id;
  //       name = data['name'];
  //       address = data['address'];
  //       tel = data['tel'];
  //       more = data['more'];
  //       orderNum = data['orderNum'];
  //       payment = data['payment'];
  //       total = data['total'];
  //       for (var item in data['order']) {
  //         orders.add(item);
  //       }
  //       isFound = true;
  //     }
  //   }
  //   setState(() {
  //     isLoaded = true;
  //   });
  // }

  confirmAlert() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'ยืนยันการส่งออเดอร์',
              style: TextStyle(fontSize: 30),
            ),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[Text("ยืนยันการส่งหรือไม่?")]),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  //deleteOrder();
                },
              ),
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // deleteOrder() {
  //   CollectionReference collection =
  //       FirebaseFirestore.instance.collection('Delivery');

  //   collection
  //       .doc(docId)
  //       .delete()
  //       .then((value) => {})
  //       .catchError((error) => print("Failed to delete user: $error"));

  //   Fluttertoast.showToast(
  //       msg: "ยกเลิกออเดอร์เรียบร้อย", gravity: ToastGravity.BOTTOM);
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => Home()));
  // }
}
