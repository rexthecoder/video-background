import 'package:flutter/material.dart';
import 'package:africanflutterrdeveloper/screen_layout/starter_screen_page.dart';




void main() {
  runApp(
    MaterialApp(
      title: 'African Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: StarterScreenPage.starterScreen,
      routes: {
        StarterScreenPage.starterScreen : (context) => StarterScreenPage()
      },
    )
  );
}



