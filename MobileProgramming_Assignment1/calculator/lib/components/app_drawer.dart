import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 1, 114, 227),
            ),
            accountName: Text(
              'Roger',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'R',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Signup'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/signup');
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: const Text('Calculator'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/calculator');
            },
          ),
        ],
      ),
    );
  }
}
