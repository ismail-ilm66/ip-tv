import 'dart:math' as math; // Import the math library
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../playlist/views/playlist_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => PlaylistView());
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with logo and custom loading indicator
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/iptv logo.png',
                  height: 150, // Adjust height as needed
                ),
                const SizedBox(height: 20), // Spacing between logo and loading indicator
                // Custom loading indicator
                CustomCircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatefulWidget {
  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _CircularProgressPainter(_controller.value),
          );
        },
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;

  _CircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final double radius = size.width / 2;
    final double dotRadius = radius / 6;

    for (int i = 0; i < 12; i++) {
      final double angle = (i * 30 + (progress * 360)) * math.pi / 180;
      final double x = radius + radius * 0.8 * math.cos(angle);
      final double y = radius + radius * 0.8 * math.sin(angle);
      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
