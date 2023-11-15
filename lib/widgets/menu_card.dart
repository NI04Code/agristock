import 'package:flutter/material.dart';
import 'package:weaponry/screens/weapon_form.dart';
import 'package:weaponry/screens/weapon_list.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Senjata") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WeaponFormPage()));
          }
          if (item.name == "Lihat Senjata") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WeaponListPage()));
          }

        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final IconData icon;
  final Color color;

  MenuItem(this.name, this.icon, this.color);
}
