import 'package:flutter/material.dart';
import 'package:weaponry/widgets/left_drawer.dart';
import 'package:weaponry/widgets/menu_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<MenuItem> items = [
    MenuItem("Lihat Senjata", Icons.checklist, const Color.fromRGBO(76, 175, 80, 1)),
    MenuItem("Tambah Senjata", Icons.add_circle_outline, Colors.lime),
    MenuItem("Logout", Icons.logout, Colors.teal),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  Widget build(BuildContext context) {
      return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Weapon Inventory',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.green,
    ),
    drawer: const LeftDrawer(),
    body: SingleChildScrollView(
      // Widget wrapper yang dapat discroll
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Set padding dari halaman
        child: Column(
          // Widget untuk menampilkan children secara vertikal
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
              child: Text(
                'Your Inventory', // Text yang menandakan toko
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Grid layout
            GridView.count(
              // Container pada card kita.
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items.map((MenuItem item) {
                // Iterasi untuk setiap item
                return MenuCard(item);
              }).toList(),
            ),
          ],
        ),
      ),
    ),
  );
  }

}

