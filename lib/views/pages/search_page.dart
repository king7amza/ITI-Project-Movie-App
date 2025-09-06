import 'package:flutter/material.dart';
import 'package:iti_project_movie_app/views/widgets/search_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(child: Column(children: [SearchItem()])),
    );
  }
}
