import 'package:flutter/material.dart';

import 'PetShown.dart';

void main() {
  runApp(PetFormApp());
}

class PetFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PetFormScreen(),
    );
  }
}

class PetFormScreen extends StatefulWidget {
  @override
  _PetFormScreenState createState() => _PetFormScreenState();
}

class _PetFormScreenState extends State<PetFormScreen> {
  TextEditingController _breedController = TextEditingController();
  TextEditingController _petCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "ONE LAST THING!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Enter Your Pet Breed",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _breedController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "How Many Pets Do You Own?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _petCountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            Spacer(), // Pushes the button to the bottom
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PetsApp()));
                  print("Breed: ${_breedController.text}, Pets: ${_petCountController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 30), // Adds spacing at the bottom
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _breedController.dispose();
    _petCountController.dispose();
    super.dispose();
  }
}
