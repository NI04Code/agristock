import 'package:flutter/material.dart';
import 'package:weaponry/models/weapon.dart'; 
import 'package:weaponry/widgets/left_drawer.dart';

class WeaponListPage extends StatelessWidget {
  const WeaponListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Senjata'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: Weapon.weaponList.length,
        itemBuilder: (context, index) {
          Weapon currentWeapon = Weapon.weaponList[index];
          return ListTile(
            title: Text(currentWeapon.name),
            subtitle: Text(
                'Jumlah: ${currentWeapon.amount}\n  Atk: ${currentWeapon.atk}\n '),
            isThreeLine: true,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Weapon Detail'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama: ${currentWeapon.name}'),
                          Text('Jumlah Weapon: ${currentWeapon.amount}'),
                          Text('Atk: ${currentWeapon.atk}'),
                          Text('Crit Rate: ${currentWeapon.critRate}'),
                          Text('Crit Dmg: ${currentWeapon.critDmg}'),
                          Text('Deskripsi: ${currentWeapon.description}'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}