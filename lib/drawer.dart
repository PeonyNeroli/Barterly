import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person),
              ),
              title: Text(
                'Dude Anggara',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Dude@gmail.com'),
              trailing: Text(
                '1000 PTS',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Course'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/course');
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/search');
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Message'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/message');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/account');
              },
            ),
          ],
        ),
      ),
    );
  }
}
