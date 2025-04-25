import 'package:flutter/material.dart';
import 'package:get_qoute/app/features/theme/provider/theme_provider.dart'
    show ThemeProvider;
import 'package:provider/provider.dart' show Consumer;

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return IconButton(
        onPressed: () => themeProvider.changeTheme(
          themeProvider.isSystemTheme
              ? ThemeMode.light
              : themeProvider.isDarkTheme
                  ? ThemeMode.light
                  : ThemeMode.dark,
        ),
        icon: Icon(themeProvider.isSystemTheme
            ? Icons.add_to_home_screen_sharp
            : themeProvider.isDarkTheme
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
      );
    });
  }
}
