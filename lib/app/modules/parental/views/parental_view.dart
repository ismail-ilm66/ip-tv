import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../controllers/parental_controller.dart';
//import '../views/home_view.dart'; // Import the HomeView

class ParentalView extends GetView<ParentalController> {
  const ParentalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the responsive size of the box
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double boxWidth = screenWidth * 0.5; // 50% of screen width
    double boxHeight = screenHeight * 0.8; // 40% of screen height

    return Scaffold(
      backgroundColor: Colors.black, // Set the whole screen background color to black
      body: Stack(
        children: [
          // Top background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bg3.png', // Top background image
              fit: BoxFit.cover,
            ),
          ),
          // Icon background image
          Positioned(
            bottom: 13,
            left: 100,
            right: 100,
            child: Image.asset(
              'assets/images/bg_icons.png', // Icons background image
              fit: BoxFit.contain,
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: boxWidth,
              height: boxHeight,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Parental Control',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Enter Pin'),
                  const SizedBox(height: 10),
                  _buildTextField('Confirm Pin'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton('Skip', Colors.black.withOpacity(0.4), Colors.white, () {
                        Get.to(() => HomeView()); // Navigate to HomeView
                      }),
                      _buildButton('Set', Colors.red, Colors.white, () {
                        // Handle set action
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey), // Grey hint text
          filled: true,
          fillColor: Colors.white, // White background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: TextStyle(color: Colors.black), // Black text color
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        textStyle: TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
