import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/colors/colors.dart';

class AddButton extends StatelessWidget {
  final void Function()? handleAddTask;
  const AddButton({
    super.key,
    required this.handleAddTask,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleAddTask,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Add",
            style: GoogleFonts.poppins(
              color: Colors.grey[900],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
