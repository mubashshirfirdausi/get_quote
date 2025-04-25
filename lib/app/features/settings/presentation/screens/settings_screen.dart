import 'package:flutter/material.dart';
import 'package:get_qoute/app/features/settings/presentation/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, themeProvider, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Material Design Version Dropdown
                const Text(
                  'Material Design',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<bool>(
                    value: themeProvider.useMaterial3,
                    isExpanded: true,
                    underline: const SizedBox(),
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.setUseMaterial3(value);
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: true,
                        child: Text('Material 3'),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text('Material 2'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Theme Mode Dropdown
                const Text(
                  'Theme Mode',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<ThemeMode>(
                    value: themeProvider.themeMode,
                    isExpanded: true,
                    underline: const SizedBox(),
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Light'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Dark'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text('System'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Theme Color Dropdown
                const Text(
                  'Theme Color',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<ThemeColor>(
                    value: themeProvider.themeColor,
                    isExpanded: true,
                    underline: const SizedBox(),
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.setThemeColor(value);
                      }
                    },
                    items: ThemeColor.values.map((color) {
                      return DropdownMenuItem(
                        value: color,
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: color.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(color.name),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
