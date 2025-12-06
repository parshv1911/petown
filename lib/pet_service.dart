import 'package:flutter/material.dart';

import 'PetShown.dart';

class PetService extends StatefulWidget {
  @override
  _PetServiceState createState() => _PetServiceState();
}

class _PetServiceState extends State<PetService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PETSOWN"),
        backgroundColor: Colors.grey[300], // Light grey background
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(
                context,
              ).openDrawer();
            },
          ),
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PetsHomePage(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.pets),
              title: Text("My Pets"),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Pets",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // **Pet Section**
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Placeholder color
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Pet name"),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Placeholder color
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Add Pet"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            Text(
              "Our Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400], // Grey button
              ),
              child: Text("Booking"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PetService(),
  ));
}
