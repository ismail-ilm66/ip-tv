import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/modules/splash/views/splash_view.dart';
// import 'controllers/splash_controller.dart';
// import 'views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ARK VIP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashView(),
        ),
        // Add other pages here
      ],
    );
  }
}
