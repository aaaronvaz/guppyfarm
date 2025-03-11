import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, size: 70, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "User Name",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "user@example.com",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap:
                () => {
                  Navigator.pop(context),
                  Navigator.pushReplacementNamed(context, '/'),
                },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Us"),
            onTap:
                () => {
                  Navigator.pop(context),
                  Navigator.pushReplacementNamed(context, '/About'),
                },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact Us'),
            onTap:
                () => {
                  Navigator.pop(context),
                  Navigator.pushReplacementNamed(context, '/Contact'),
                },
          ),
          ExpansionTile(
            leading: Icon(Icons.category),
            title: Text("Categories"),
            initiallyExpanded: true,
            //expansionAnimationStyle: AnimationStyle(),
            children: [
              ListTile(
                leading: Icon(Icons.water),
                title: Text("Live Fishes"),
                onTap:
                    () => {
                      Navigator.pop(context),
                      Navigator.pushReplacementNamed(
                        context,
                        '/Category/Live-Fishes',
                      ),
                    },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text("Wish-List"),
            onTap:
                () => {
                  Navigator.pop(context),
                  Navigator.pushReplacementNamed(context, '/Wish-List'),
                },
          ),
        ],
      ),
    );
  }
}
