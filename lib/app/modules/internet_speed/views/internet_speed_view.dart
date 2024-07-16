import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/internet_speed_controller.dart';

class InternetSpeedView extends StatelessWidget {
  final InternetSpeedController controller = Get.put(InternetSpeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Get.back(); // Navigate to the previous screen
              },
              child: Image.asset(
                'assets/images/back_button.png',
                height: 24,
                width: 24,
              ),
            ),
          ),
          // Form content
          Center(
            child: Container(
              width: 600,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Internet Speed Test',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Speedometer image
                    Image.asset(
                      'assets/images/speedometer.png', // Replace with your speedometer image
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    // Speed text
                    Obx(() {
                      return Text(
                        '${controller.speed.value} Mbps',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle OK action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
