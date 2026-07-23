import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.person_outline), title: Text('Account')),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifications'),
          ),
          ListTile(leading: Icon(Icons.logout), title: Text('Log out')),
        ],
      ),
    );
  }
}
