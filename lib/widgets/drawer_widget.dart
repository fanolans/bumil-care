import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("${assetImages}background.jpg"),
                  fit: BoxFit.cover),
            ),
            accountEmail: Text('mailenolan@gmail.com'),
            accountName: Text('Farrel Nolan Syahdony'),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: const Text(
              'Profil',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calculate,
            ),
            title: const Text(
              'Kalkulator BMI',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
            ),
            title: const Text(
              'Info',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: const Text(
              'Keluar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
