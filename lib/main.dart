import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti_project_movie_app/theme/color_scheme.dart';
import 'package:iti_project_movie_app/views/pages/custom_bottom_navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MaterialApp(
      theme: ThemeData(colorScheme: colorScheme),
      debugShowCheckedModeBanner: false,
      home: const CustomBottomNavbar(),
    ),
  );
}
