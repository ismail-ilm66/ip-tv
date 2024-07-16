import 'package:get/get.dart';

import '../modules/M3U_playlist/bindings/m3_u_playlist_binding.dart';
import '../modules/M3U_playlist/views/m3_u_playlist_view.dart';
import '../modules/automation/bindings/automation_binding.dart';
import '../modules/automation/views/automation_view.dart';
import '../modules/external_player/bindings/external_player_binding.dart';
import '../modules/external_player/views/external_player_view.dart';
import '../modules/general_setting/bindings/general_setting_binding.dart';
import '../modules/general_setting/views/general_setting_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/internet_speed/bindings/internet_speed_binding.dart';
import '../modules/internet_speed/views/internet_speed_view.dart';
import '../modules/live_TV/bindings/live_t_v_binding.dart';
import '../modules/live_TV/views/live_t_v_view.dart';
import '../modules/parental/bindings/parental_binding.dart';
import '../modules/parental/views/parental_view.dart';
import '../modules/playlist/bindings/playlist_binding.dart';
import '../modules/playlist/views/playlist_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/stream_format/bindings/stream_format_binding.dart';
import '../modules/stream_format/views/stream_format_view.dart';
import '../modules/themes/bindings/themes_binding.dart';
import '../modules/themes/views/themes_view.dart';
import '../modules/time_format/bindings/time_format_binding.dart';
import '../modules/time_format/views/time_format_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PLAYLIST,
      page: () => PlaylistView(),
      binding: PlaylistBinding(),
    ),
    GetPage(
      name: _Paths.M3_U_PLAYLIST,
      page: () => M3UPlaylistView(),
      binding: M3UPlaylistBinding(),
    ),
    GetPage(
      name: _Paths.PARENTAL,
      page: () => const ParentalView(),
      binding: ParentalBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.GENERAL_SETTING,
      page: () => const GeneralSettingView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.STREAM_FORMAT,
      page: () => const StreamFormatView(),
      binding: StreamFormatBinding(),
    ),
    GetPage(
      name: _Paths.TIME_FORMAT,
      page: () => const TimeFormatView(),
      binding: TimeFormatBinding(),
    ),
    GetPage(
      name: _Paths.AUTOMATION,
      page: () => const AutomationView(),
      binding: AutomationBinding(),
    ),
    GetPage(
      name: _Paths.EXTERNAL_PLAYER,
      page: () => const ExternalPlayerView(),
      binding: ExternalPlayerBinding(),
    ),
    GetPage(
      name: _Paths.INTERNET_SPEED,
      page: () => InternetSpeedView(),
      binding: InternetSpeedBinding(),
    ),
    GetPage(
      name: _Paths.THEMES,
      page: () => const ThemesView(),
      binding: ThemesBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_T_V,
      page: () => const LiveTVView(),
      binding: LiveTVBinding(),
    ),
  ];
}
