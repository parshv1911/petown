import 'package:flutter/material.dart';

import 'Final_bill.dart';
import 'PetShown.dart';

class PetPackagesScreen extends StatefulWidget {
  @override
  State<PetPackagesScreen> createState() => _PetPackagesScreenState();
}

class _PetPackagesScreenState extends State<PetPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: Text(
          "PETSOWN",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetsApp()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.pets),
              title: Text("My Pets"),
              onTap: () {},
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Pets",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildPetPlaceholder("Pet name"),
                SizedBox(width: 20),
                _buildPetPlaceholder("Add Pet"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Our Services > Package",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildPackage("Days Package", [
                    "Bath wash",
                    "Full Grooming",
                    "Roaming a day",
                    "Video call",
                    "Vaccination",
                    "Meals",
                  ]),
                  _buildPackage("Per/Hour Package", [
                    "Bath wash",
                    "Video call",
                    "Roaming a day",
                    "Meal",
                  ]),
                  _buildPackage("Vaccination", []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetPlaceholder(String label) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildPackage(String title, List<String> features) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          for (var feature in features) Text(feature),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                print("aksbbvab");
               Navigator.push(context, MaterialPageRoute(builder: (context) => PetPaymentScreen(),));
              },
              child: Text("Select Package"),
            ),
          ),
        ],
      ),
    );
  }
}
