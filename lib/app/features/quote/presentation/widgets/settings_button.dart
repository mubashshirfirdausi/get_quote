import 'package:flutter/material.dart';
import 'package:get_qoute/app/features/settings/presentation/provider/settings_provider.dart'
    show SettingsProvider;
import 'package:get_qoute/app/features/settings/presentation/screens/settings_screen.dart';
import 'package:provider/provider.dart' show Consumer;

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(builder: (context, themeProvider, child) {
      return IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          ));
        },
        icon: const Icon(Icons.settings_outlined),
        // onPressed: () => themeProvider.changeTheme(
        //   themeProvider.isSystemTheme
        //       ? ThemeMode.light
        //       : themeProvider.isDarkTheme
        //           ? ThemeMode.light
        //           : ThemeMode.dark,
        // ),
        // icon: Icon(themeProvider.isSystemTheme
        //     ? Icons.add_to_home_screen_sharp
        //     : themeProvider.isDarkTheme
        //         ? Icons.light_mode_outlined
        //         : Icons.dark_mode_outlined),
      );
    });
  }
}
