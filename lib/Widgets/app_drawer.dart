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
                  "Guest",
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
            leading: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 243, 219, 1),
              size: 25,
            ),
            title: Text("Home",style: Theme.of(context).textTheme.bodyMedium,),
            onTap:
                () => {
                  Navigator.pop(context),
                  Navigator.pushReplacementNamed(context, '/Home'),
                },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.teal, size: 25),
            title: Text("About Us",style: Theme.of(context).textTheme.bodyMedium,),
            onTap:
                () => {
                  Navigator.pop(context),
                  Navigator.pushReplacementNamed(context, '/About'),
                },
          ),
          /* ListTile(
            leading: Icon(Icons.sms),
            title: Text('Contact Us'),
            onTap:
                () => {
                  Navigator.pop(context),
                  Navigator.pushReplacementNamed(context, '/Contact'),
                },
          ), */
          ExpansionTile(
            leading: Icon(Icons.category,size: 25,),
            title: Text("Categories",style: Theme.of(context).textTheme.bodyMedium,),
            initiallyExpanded: true,
            //expansionAnimationStyle: AnimationStyle(),
            children: [
              ListTile(
                leading: Icon(Icons.water, color: Colors.blue,size: 25,),
                title: Text("Live Fishes",style: Theme.of(context).textTheme.bodyMedium,),
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
            leading: Icon(Icons.favorite, color: Colors.red,size: 25,),
            title: Text("Wish-List",style: Theme.of(context).textTheme.bodyMedium,),
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
