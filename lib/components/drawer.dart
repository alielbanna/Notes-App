import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';
import 'package:notes_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.book,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          DrawerTile(
            title: 'Notes',
            leading: const Icon(Icons.edit),
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
            title: 'Settings',
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
