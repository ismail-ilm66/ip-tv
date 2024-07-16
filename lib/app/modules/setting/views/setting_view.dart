import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../automation/views/automation_view.dart';
import '../../external_player/views/external_player_view.dart';
import '../../general_setting/views/general_setting_view.dart';
import '../../internet_speed/views/internet_speed_view.dart';
import '../../stream_format/views/stream_format_view.dart';
import '../../themes/views/themes_view.dart';
import '../../time_format/views/time_format_view.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

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
          // Content
          Column(
            children: [
              // Back button and title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        'assets/images/back_button.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(width: 22),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.only(left:120.0,right: 120),
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                  children: [
                    _buildSettingItem('General Settings', 'assets/icons/gs.png', onTap: () {
                      Get.to(() => GeneralSettingView());
                    }),
                    _buildSettingItem('Stream Format', 'assets/icons/stream.png',onTap:() {
                      Get.to(() => StreamFormatView());
                    }),
                    _buildSettingItem('Time Format', 'assets/icons/clock.png',onTap:(){
                      Get.to(() => TimeFormatView());
                    }),
                    _buildSettingItem('Parental Control', 'assets/icons/parental-control.png'),
                    _buildSettingItem('Automation', 'assets/icons/automation.png',onTap:(){
                      Get.to(() => AutomationView());
                    }),
                    _buildSettingItem('EPG', 'assets/icons/epg.png'),
                    _buildSettingItem('Themes', 'assets/icons/themes.png',onTap: (){
                      Get.to(() => ThemesView());
                    }),
                    _buildSettingItem('External Players', 'assets/icons/player.png',onTap:(){
                      Get.to(() => ExternalPlayerView());
                    }),
                    _buildSettingItem('Internet Speed Test', 'assets/icons/speed.png',onTap:(){
                      Get.to(() => InternetSpeedView());
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, String iconPath,{VoidCallback? onTap}) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
