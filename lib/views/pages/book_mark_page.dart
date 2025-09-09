import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_project_movie_app/models/movies_model.dart';
import 'package:iti_project_movie_app/utils/app_colors.dart';

class BookMarkPage extends StatefulWidget {
  // final MoviesModel selectedMovie;
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    final bookMarkedMovies = listOfMovies
        .where((movie) => movie.isBookMarked == true)
        .toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: bookMarkedMovies.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(minHeight: 120),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor,
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie poster image
                      Container(
                        width: 70,
                        height: 105,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.lightGrey,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            imageUrl: bookMarkedMovies[index].imgUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.lightGrey,
                                child: const Icon(
                                  Icons.movie,
                                  color: AppColors.grey,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Movie details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Title
                            Text(
                              bookMarkedMovies[index].movieName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightBlack,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Description
                            Text(
                              bookMarkedMovies[index].description,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.darkGrey1,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            // Rating
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.gold,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  bookMarkedMovies[index].rating.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightBlack,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  bookMarkedMovies[index].numberOfPeopleRated
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.darkGrey1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Bookmark icon
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final movieIndex = listOfMovies.indexWhere(
                              (movieItem) =>
                                  movieItem.id == bookMarkedMovies[index].id,
                            );
                            debugPrint(
                              "selected movie bookmark before update : ${listOfMovies[movieIndex].isBookMarked}",
                            );
                            listOfMovies[movieIndex] = listOfMovies[movieIndex]
                                .copyWith(isBookMarked: false);
                            debugPrint(
                              "selected movie bookmark after update : ${listOfMovies[movieIndex].isBookMarked}",
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.bookmark,

                            color: AppColors.primaryColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
