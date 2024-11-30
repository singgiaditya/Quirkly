import 'dart:convert';

class UserEntity {
    final String? name;
    final String? email;
    final String? phoneNumber;
    final String? password;

    UserEntity({
        this.name,
        this.email,
        this.phoneNumber,
        this.password,
    });

    factory UserEntity.fromRawJson(String str) => UserEntity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
    };
}
