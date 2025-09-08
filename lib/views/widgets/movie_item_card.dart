import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_project_movie_app/models/movies_model.dart';
import 'package:iti_project_movie_app/utils/app_colors.dart';

class MovieItemCard extends StatefulWidget {
  final int movieItemIndex;
  const MovieItemCard({super.key, required this.movieItemIndex});

  @override
  State<MovieItemCard> createState() => _MovieItemCardState();
}

class _MovieItemCardState extends State<MovieItemCard> {
  @override
  Widget build(BuildContext context) {
    final movie = listOfMovies[widget.movieItemIndex];
    return Container(
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
              width: 80,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.lightGrey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: movie.imgUrl,
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
                    movie.movieName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightBlack,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Description
                  Text(
                    movie.description,
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
                      const Icon(Icons.star, color: AppColors.gold, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        movie.rating.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightBlack,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.numberOfPeopleRated.toString(),
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
                    (movieItem) => movieItem.id == movie.id,
                  );
                  listOfMovies[movieIndex] = movie.copyWith(
                    isBookMarked: !movie.isBookMarked,
                  );
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  listOfMovies[widget.movieItemIndex].isBookMarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: listOfMovies[widget.movieItemIndex].isBookMarked
                      ? AppColors.primaryColor
                      : AppColors.lightBlack,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
