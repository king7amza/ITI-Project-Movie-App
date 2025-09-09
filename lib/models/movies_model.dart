import 'package:equatable/equatable.dart';

class MoviesResponse extends Equatable {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => MoviesResponse(
    page: json['page'] as int? ?? 0,
    results: (json['results'] as List<dynamic>? ?? [])
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int? ?? 0,
    totalResults: json['total_results'] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results.map((e) => e.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class Movie extends Equatable {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json['adult'] as bool? ?? false,
    backdropPath: json['backdrop_path'] as String?,
    genreIds: (json['genre_ids'] as List<dynamic>? ?? [])
        .map((e) => (e as num).toInt())
        .toList(),
    id: (json['id'] as num?)?.toInt() ?? 0,
    originalLanguage: json['original_language'] as String? ?? '',
    originalTitle: json['original_title'] as String? ?? '',
    overview: json['overview'] as String? ?? '',
    popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
    posterPath: json['poster_path'] as String?,
    releaseDate: _parseDate(json['release_date']),
    title: json['title'] as String? ?? '',
    video: json['video'] as bool? ?? false,
    voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate != null ? _formatDate(releaseDate!) : null,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
  ];

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is String && value.trim().isEmpty) return null;
    try {
      return DateTime.parse(value as String);
    } catch (_) {
      return null;
    }
  }

  static String _formatDate(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}
