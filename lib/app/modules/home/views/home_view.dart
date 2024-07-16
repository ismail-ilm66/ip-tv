import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../live_TV/views/live_t_v_view.dart';
import '../../setting/views/setting_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: [
                // Side Menu
                Container(
                  width: 200,
                  color: Color(0x1E000399), // Updated background color
                  child: Column(
                    children: [
                      Container(
                        color: Color(0xFF450509), // Background color for the logo section
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/iptv logo.png', // Replace with your logo
                              height: 50,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'ARK VIP',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildMenuItem(Icons.home, 'Home', selected: true),
                              _buildMenuItem(Icons.live_tv, 'Live TV', onTap: () {
                                Get.to(() => LiveTVView()); // Navigate to LiveTVView
                              }),
                              _buildMenuItem(Icons.movie, 'Movies'),
                              _buildMenuItem(Icons.screen_share, 'Multi Screen'),
                              _buildMenuItem(Icons.tv, 'Series'),
                              _buildMenuItem(Icons.sports, 'Sports'),
                              _buildMenuItem(Icons.playlist_play, 'Playlist'),
                              _buildMenuItem(Icons.videocam, 'Recording'),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconButton('assets/images/vpn.png'),
                          _buildIconButton('assets/images/setting.png', onTap: () {
                            Get.to(() => SettingView());
                          }),
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                // Main Content
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 50),
                              Flexible(
                                child: Image.asset(
                                  'assets/images/sample.png', // Replace with your content image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Text(
                          'Expiration : 24/09/2022',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool selected = false, VoidCallback? onTap}) {
    return Container(
      color: selected ? Color(0xFF3C0F71) : Colors.black.withOpacity(0.1),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildIconButton(String imagePath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black, // Set the background color to black
        padding: EdgeInsets.all(8.0), // Add padding for better alignment
        child: Image.asset(imagePath, height: 35, width: 35),
      ),
    );
  }
}
