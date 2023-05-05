import 'dart:convert';

List<MenuType> menuTypeFromJson(String str) => List<MenuType>.from(json.decode(str).map((x) => MenuType.fromJson(x)));

class MenuType {
    MenuType({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory MenuType.fromJson(Map<String, dynamic> json) => MenuType(
        id: json["id"],
        name: json["name"],
    );
}