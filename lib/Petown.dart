import 'package:flutter/material.dart';
import 'package:pet_own/appointment.dart';

import 'PetShown.dart';

class ShelterHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
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
                  MaterialPageRoute(
                    builder: (context) => PetsApp(),
                  ),
                );// Go back instead of pushing a new MaterialApp
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
            SizedBox(height: 20),
            _buildDropdownButton("Location", ["City A", "City B", "City C"]),
            SizedBox(height: 20),
            _buildDropdownButton("Cost Range", ["Low", "Medium", "High"]),
            SizedBox(height: 30),
            Text(
              "Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildShelterItem(
                    context,
                    "https://via.placeholder.com/60",
                    "Happy Paws Shelter",
                  ),
                  SizedBox(height: 20),
                  _buildShelterItem(
                    context,
                    "https://via.placeholder.com/60",
                    "Furry Friends Home",
                  ),
                  SizedBox(height: 20),
                  _buildShelterItem(
                    context,
                    "https://via.placeholder.com/60",
                    "Pet Haven",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String title, List<String> options) {
    String? selectedValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(title, style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            selectedValue = value;
          },
        ),
      ),
    );
  }

  Widget _buildShelterItem(BuildContext context, String imageUrl, String shelterName) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppointmentScreen()),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey,
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shelterName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("Owner Name"),
              Text("Address"),
              Text("Cost"),
            ],
          ),
        ],
      ),
    );
  }
}
