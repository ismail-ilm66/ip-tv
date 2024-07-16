import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../parental/views/parental_view.dart';
import '../controllers/m3_u_playlist_controller.dart';
//import '../views/parental_view.dart'; // Import the ParentalView

class M3UPlaylistView extends GetView<M3UPlaylistController> {
  const M3UPlaylistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Get.back(); // Navigate to the previous screen
              },
              child: Image.asset(
                'assets/images/back_button.png',
                height: 36, // Adjusted size
                width: 36, // Adjusted size
              ),
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: 600,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'M3U playlist via URL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildTextField('Playlist name')),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField('Playlist URL')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildTextField('User name')),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField('Password')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton('Cancel', Colors.black.withOpacity(0.4), Colors.white, () {
                        // Handle cancel action
                      }),
                      _buildButton('Save', Colors.red, Colors.white, () {
                        // Navigate to ParentalView
                        Get.to(() => ParentalView());
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
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey), // Grey hint text
        filled: true,
        fillColor: Colors.white, // White background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.black), // Black text color
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
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

