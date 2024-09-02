import 'package:flutter/material.dart';

class Appdrawer extends StatefulWidget {
  static const screenName = '/Appdrawer';

  @override
  State<Appdrawer> createState() => _AppdrawerState();
}

class _AppdrawerState extends State<Appdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/images/profile.png'), // Replace with actual image URL or asset
                ),
                SizedBox(height: 10),
                Text(
                  'Emily Cyrus',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Book A Nanny'),
            onTap: () {},
          ),
          ListTile(
            title: Text('How It Works'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Why Nanny Vanny'),
            onTap: () {},
          ),
          ListTile(
            title: Text('My Bookings'),
            onTap: () {},
          ),
          ListTile(
            title: Text('My Profile'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Support'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
