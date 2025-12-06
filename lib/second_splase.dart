import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_own/pet_details.dart';

class SecondSplase extends StatefulWidget {
  const SecondSplase({super.key});

  @override
  State<SecondSplase> createState() => _SecondSplaseState();
}

class _SecondSplaseState extends State<SecondSplase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "In Your Dog a Male or Female ?",
                  style: GoogleFonts.actor(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            // SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.amber,
                  child: Image(image: NetworkImage("https://media.istockphoto.com/id/1456527590/vector/male-icon-with-reflection-on-white-background.jpg?s=612x612&w=0&k=20&c=6f3F_HbMoMXX7Y6x8xevjFQkZDOKgi0IGl1MYEtZMgE=")),
                ),SizedBox(width: 25,),
                Container(
                  width: 150,
                  height: 150,
                  child: Image(image: NetworkImage("https://media.istockphoto.com/id/1300219183/vector/womens-washroom-accessibility-icon.jpg?s=612x612&w=0&k=20&c=DY6-9GGvymAb5lifPfiv8OCniPWLCT31S4ptD_j8CdE=")),
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Male",
                  style: GoogleFonts.aboreto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Female",
                  style: GoogleFonts.aboreto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(100, 50),
                        backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetDetails(),
                          ));
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.actor(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
