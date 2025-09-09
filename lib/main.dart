import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti_project_movie_app/services/movie_services.dart';
import 'package:iti_project_movie_app/theme/color_scheme.dart';
import 'package:iti_project_movie_app/ui/data/pages/custom_bottom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final MovieServices movieServices = MovieServices();
  await movieServices.fetchMovies();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: colorScheme),
      debugShowCheckedModeBanner: false,
      home: const CustomBottomNavbar(),
    );
  }
}
