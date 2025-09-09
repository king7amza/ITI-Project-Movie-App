import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iti_project_movie_app/models/movies_model.dart';
import 'package:iti_project_movie_app/utils/app_colors.dart';
import 'package:iti_project_movie_app/views/widgets/movie_item_card.dart';
import 'package:iti_project_movie_app/views/widgets/search_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightBlack,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SearchItem(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listOfMovies.length,
                  itemBuilder: (context, index) {
                    return MovieItemCard(movieItemIndex: index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
