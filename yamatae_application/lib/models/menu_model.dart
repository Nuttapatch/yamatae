import 'dart:convert';

import 'package:flutter/material.dart';

List<Menu> menuFromJson(String str) =>
    List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

class Menu {
  Menu({
    required this.menuID,
    required this.menuTypeID,
    required this.name,
    required this.price,
    required this.description,
    required this.image
  });

  String menuID;
  String menuTypeID;
  String name;
  int price;
  String description;
  String image;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuID: json["menuID"],
        menuTypeID: json["menuTypeID"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
      );
}
