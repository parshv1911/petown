import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in.dart';
import 'sign_out.dart' show SignOut;

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        'Logout',
        style: GoogleFonts.actor(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      content: Text(
        'Are you sure you want to log out?',
        style: GoogleFonts.actor(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Cancel
          child: Text(
            'Cancel',
            style: GoogleFonts.actor(
              color: Colors.blueAccent,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const SignIn()),
                  (route) => false,
            );
          },
          child: Text(
            'Logout',
            style: GoogleFonts.actor(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
