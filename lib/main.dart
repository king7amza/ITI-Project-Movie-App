import 'package:flutter/material.dart';
import 'package:iti_project_movie_app/views/pages/custom_bottom_navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CustomBottomNavbar(),
    ),
  );
}
