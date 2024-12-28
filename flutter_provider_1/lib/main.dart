import 'package:flutter/material.dart';
import 'package:flutter_provider_1/provider/auth_provider.dart';
import 'package:flutter_provider_1/provider/counter_provider.dart';
import 'package:flutter_provider_1/provider/example_one_provider.dart';
import 'package:flutter_provider_1/provider/favourite_provider.dart';
import 'package:flutter_provider_1/provider/theme_changer.dart';
import 'package:flutter_provider_1/screens/count_example.dart';
import 'package:flutter_provider_1/screens/dark_theme.dart';
import 'package:flutter_provider_1/screens/example_one.dart';
import 'package:flutter_provider_1/screens/favourite/favourite_screen.dart';
import 'package:flutter_provider_1/screens/login_screen.dart';
import 'package:flutter_provider_1/screens/notify_listener_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CounterProvider(),),
        ChangeNotifierProvider(create: (_)=> ExampleOneProvider(),),
        ChangeNotifierProvider(create: (_)=> FavouriteProvider(),),
        ChangeNotifierProvider(create: (_)=> ThemeChanger(),),
        ChangeNotifierProvider(create: (_)=> AuthProvider(),),
      ],
     child: Builder(builder: (BuildContext context){
      final themeChanger = Provider.of<ThemeChanger>(context);
      return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeChanger.themeMode,
      
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        primaryColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurpleAccent
        )
      ),
      home: LoginScreen(),
    );
     }),
      
    );

  }
}