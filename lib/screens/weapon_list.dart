import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weaponry/models/weapon.dart';
import 'package:weaponry/screens/weapon_details.dart';
import 'package:weaponry/widgets/left_drawer.dart';

class WeaponPage extends StatefulWidget {
    const WeaponPage({Key? key}) : super(key: key);

    @override
    _WeaponPageState createState() => _WeaponPageState();
}

class _WeaponPageState extends State<WeaponPage> {
Future<List<Weapon>> fetchWeapon() async {
    var url = Uri.parse(
        'https://naufal-ichsan-tugas/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Weapon
    List<Weapon> listWeapon = [];
    for (var d in data) {
        if (d != null) {
            listWeapon.add(Weapon.fromJson(d));
        }
    }
    return listWeapon;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Weapon'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchWeapon(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data senjata.",
                            style:
                                TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell(
                          onTap: () { 
                          Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => DetailPage(snapshot.data![index])));
                          },
                          child: Container(
                                margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            )));
                        
                              
                    }
                }
            }));
    }
}