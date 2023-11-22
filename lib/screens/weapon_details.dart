
import 'package:flutter/material.dart';
import 'package:weaponry/models/weapon.dart';

class DetailPage extends StatelessWidget {

  final Weapon x;

  const DetailPage(this.x, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Senjata'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              x.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 10),
            Text("Jumlah: ${x.fields.name}"),
            const SizedBox(height: 10),
            Text("Jumlah: ${x.fields.amount}"),
            const SizedBox(height: 10),
            Text("Atk: ${x.fields.atk}"),
            const SizedBox(height: 10),
            Text("CritDmg: ${x.fields.critDmg}"),
            const SizedBox(height: 10),
            Text("CritRate: ${x.fields.critRate}"),
            const SizedBox(height: 10),
            Text("Deskripsi: ${x.fields.description}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}