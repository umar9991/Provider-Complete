import 'package:flutter/material.dart';
import 'package:flutter_provider_1/provider/theme_changer.dart';
import 'package:provider/provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme changer"),

      ),
  body: Column(
    children: [
      RadioListTile(
        title: Text('Light Theme'),
        value: ThemeMode.light,
       groupValue: themeChanger.themeMode,
        onChanged: themeChanger.setTheme),

        RadioListTile(
          title: Text('Dark Theme'),
          value: ThemeMode.dark,
       groupValue: themeChanger.themeMode,
        onChanged: themeChanger.setTheme),

         RadioListTile(
          title: Text('System Mode'),
          value: ThemeMode.system,
       groupValue: themeChanger.themeMode,
        onChanged: themeChanger.setTheme),
    Icon(Icons.favorite)
    
    ],
  ),

    );
  }
}