import 'dart:convert';

List<Admin> adminFromJson(String str) =>
    List<Admin>.from(json.decode(str).map((x) => Admin.fromJson(x)));

class Admin {
  Admin({
    required this.adminID,
    required this.password,
  });

  String adminID;
  String password;

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        adminID: json["adminID"],
        password: json["password"],
      );
}
