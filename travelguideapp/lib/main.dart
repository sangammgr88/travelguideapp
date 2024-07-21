import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/destination_provider.dart';
import 'screens/home_screen.dart';
import 'screens/front_page.dart'; // Update with your actual file path

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DestinationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FrontPage(), // Set the initial screen to FrontPage
    );
  }
}
