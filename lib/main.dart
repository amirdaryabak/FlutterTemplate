import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app_theme/app_theme_config.dart';
import 'package:flutter_template/injector.dart';
import 'package:flutter_template/main_presentation/main_controller.dart';
import 'package:flutter_template/main_presentation/main_screen.dart';
import 'package:flutter_template/app_theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: LightThemeColors.primaryColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Injector.initDependencies();

  runApp(App());
}

class App extends StatelessWidget {
  final MainController _mainController = Get.find<MainController>();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en', ''),
          Locale('fa', ''),
        ],
        locale: const Locale('en'),
        theme: _mainController.themeMode.value == ThemeMode.dark
            ? AppThemeConfig.dark().getTheme()
            : AppThemeConfig.light().getTheme(),
        home: MainScreen(),
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
