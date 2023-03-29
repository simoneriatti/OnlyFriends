import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  @override
  HeaderDrawerState createState() => HeaderDrawerState();
}

class HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.orange,
            width: double.infinity,
            height: 130,
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Impostazioni",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                  onTap: () {
                    // Handle option 1 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text('Contacts'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Privacy'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Security'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.tablet_mac),
                  title: Text('Version'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.gavel),
                  title: Text('Terms of Service'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy Policy'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text('Open source license'),
                  onTap: () {
                    // Handle option 2 tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
