import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_own/login_out/sign_out.dart'; // Make sure SignOut exists
import 'package:pet_own/second_splase.dart';

class FirstWelcome extends StatefulWidget {
  const FirstWelcome({super.key});

  @override
  State<FirstWelcome> createState() => _FirstWelcomeState();
}

class _FirstWelcomeState extends State<FirstWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Home", style: GoogleFonts.actor()),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const SignOut(),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: GoogleFonts.actor(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Let's start by adding your pet first.",
              style: GoogleFonts.actor(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Do you have a dog or cat?",
              style: GoogleFonts.actor(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Dog
                _petCard(
                  imageUrl:
                  "https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg",
                ),
                // Cat
                _petCard(
                  imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDCsqRYLAFDdL4Ix_AHai7kNVyoPV9Ssv1xg&s",
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(400, 50),
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SecondSplase()),
                  );
                },
                child: Text(
                  "Let's Get Started",
                  style: GoogleFonts.actor(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _petCard({required String imageUrl}) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white12),
      ),
    );
  }
}
