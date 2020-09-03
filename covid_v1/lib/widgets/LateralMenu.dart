import 'package:flutter/material.dart';

class LateralMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountEmail: Text("johndoe@somemail.com"),
              accountName: Text("John Doe"),
              arrowColor: Colors.white,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue[900],
                child: Text("JD"),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              )),
          ListTile(
              title: Text("Function 1"),
              onTap: () {
                // Update the state of the app.
                // ...
                // Then close the drawer.
                Navigator.pop(context);
              }),
          ListTile(
              title: Text("Function 2"),
              onTap: () {
                // Update the state of the app.
                // ...
                // Then close the drawer.
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
