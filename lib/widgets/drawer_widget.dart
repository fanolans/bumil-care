import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountName: Text(
              'Farrel Nolan Syahdony',
            ),
            accountEmail: Text(
              'mailenolan@gmail.com',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: const Text('Profil'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: const Text('Info'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: const Text('Keluar'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
