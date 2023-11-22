// To parse this JSON data, do
//
//     final Weapon = WeaponFromJson(jsonString);

import 'dart:convert';

List<Weapon> WeaponFromJson(String str) => List<Weapon>.from(json.decode(str).map((x) => Weapon.fromJson(x)));

String WeaponToJson(List<Weapon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Weapon {
    String model;
    int pk;
    Fields fields;

    Weapon({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Weapon.fromJson(Map<String, dynamic> json) => Weapon(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    int atk;
    int critDmg;
    int critRate;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.atk,
        required this.critDmg,
        required this.critRate,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        atk: json["atk"],
        critDmg: json["critdmg"],
        critRate: json["critrate"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "atk": atk,
        "critdmg": critDmg,
        "critrate": critRate,
        "description": description,
    };
}
