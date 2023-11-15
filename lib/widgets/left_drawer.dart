import 'package:flutter/material.dart';
import 'package:weaponry/screens/menu.dart';
import 'package:weaponry/screens/weapon_form.dart';
import 'package:weaponry/screens/weapon_list.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Column(
            children: [
              Text(
                'Weapon Inventory',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text("Catat seluruh senjatamu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  )
                  ),
            ],
          ),
          ),

          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Tambah Senjata'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WeaponFormPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('List Senjata'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WeaponListPage()));
              },
            ),
        ],
      ),
    );
  }
}