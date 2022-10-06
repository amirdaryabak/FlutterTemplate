import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/config/bloc/theme_bloc.dart';
import 'package:flutter_template/core/config/language_enum.dart';

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({
    Key? key,
    required this.tabName,
    this.screenNumber = 1,
  }) : super(key: key);
  final String tabName;
  final int screenNumber;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tab: $tabName, Screen #$screenNumber',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SimpleScreen(
                    tabName: tabName,
                    screenNumber: screenNumber + 1,
                  ),
                ),
              );
            },
            child: const Text(
              'Click Me',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
              if (themeBloc.themeMode == ThemeMode.dark) {
                themeBloc.add(
                  SetThemeEvent(
                    themeMode: ThemeMode.light,
                    language: themeBloc.language,
                  ),
                );
              } else {
                themeBloc.add(
                  SetThemeEvent(
                    themeMode: ThemeMode.dark,
                    language: themeBloc.language,
                  ),
                );
              }
            },
            child: const Text(
              'Change Theme',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
              themeBloc.add(
                SetThemeEvent(
                  themeMode: themeBloc.themeMode,
                  language: themeBloc.language == Language.en ? Language.fa : Language.en,
                ),
              );
            },
            child: Text(
              AppLocalizations.of(context)!.name,
            ),
          ),
        ],
      ),
    );
  }
}
