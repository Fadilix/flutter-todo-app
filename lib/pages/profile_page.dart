import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/colors/colors.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  String name = "Stacey";
  String school = "Harvard";
  int age = 18;
  ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: GoogleFonts.poppins(),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: mainColor,
        body: Column(
          children: [
            SizedBox(height: 20),
            //app bar
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/me.jpg"),
              ),
            ),

            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : ${name}",
                  style: GoogleFonts.poppins(
                    color: secondColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 200,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Age : ${age}",
                  style: GoogleFonts.poppins(
                    color: secondColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "School : ${school}",
                  style: GoogleFonts.poppins(
                    color: secondColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
