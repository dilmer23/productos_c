import 'dart:convert';

List<AddUser> addUserFromJson(String str) => List<AddUser>.from(json.decode(str).map((x) => AddUser.fromJson(x)));

String addUserToJson(List<AddUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddUser {
    int id;
    String email;
    String password;
    String role;
    DateTime createdAt;

    AddUser({
        required this.id,
        required this.email,
        required this.password,
        required this.role,
        required this.createdAt,
    });

    factory AddUser.fromJson(Map<String, dynamic> json) => AddUser(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
    };
}
