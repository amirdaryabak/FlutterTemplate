import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/config/app_theme/app_theme_config.dart';
import 'package:flutter_template/core/config/bloc/theme_bloc.dart';
import 'package:flutter_template/core/config/my_http_overrides.dart';
import 'package:flutter_template/feature_map/presentation/bloc/map_bloc.dart';
import 'package:flutter_template/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter_template/locator.dart';
import 'package:flutter_template/feature_main/presentation/bloc/main_bloc.dart';
import 'package:flutter_template/feature_main/presentation/screens/main_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Locator.setup();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          state as SetThemeState;
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en', ''),
              Locale('fa', ''),
            ],
            locale: const Locale('en'),
            theme: state.themeMode == ThemeMode.dark ? AppThemeConfig.dark().getTheme() : AppThemeConfig.light().getTheme(),
            home: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => locator<HomeBloc>()),
                BlocProvider(create: (_) => locator<MainBloc>()),
                BlocProvider(create: (_) => locator<MapBloc>()),
              ],
              child: MainScreen(),
            ),
          );
        },
      ),
    );
  }
}
