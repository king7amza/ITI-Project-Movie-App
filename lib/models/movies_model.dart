
class MoviesModel {
  final int id;
  final String movieName;
  final String description;
  final double rating;
  final int numberOfPeopleRated;
  final String imgUrl;
  final bool isBookMarked;

  const MoviesModel({
    required this.id,
    required this.movieName,
    required this.description,
    required this.rating,
    required this.numberOfPeopleRated,
    required this.imgUrl,
    this.isBookMarked = false,
  });

  MoviesModel copyWith({
    int? id,
    String? movieName,
    String? description,
    double? rating,
    int? numberOfPeopleRated,
    String? imgUrl,
    bool? isBookMarked,
  }) {
    return MoviesModel(
      id: id ?? this.id,
      movieName: movieName ?? this.movieName,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      numberOfPeopleRated: numberOfPeopleRated ?? this.numberOfPeopleRated,
      imgUrl: imgUrl ?? this.imgUrl,
      isBookMarked: isBookMarked ?? this.isBookMarked,
    );
  }
}

List<MoviesModel> listOfMovies = [
  MoviesModel(
    id: 1,
    movieName: "The Matrix",
    description:
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war for its control.",
    rating: 8.7,
    numberOfPeopleRated: 1000000,
    imgUrl:
        "https://i.postimg.cc/XvcCxLCS/regrege.jpg",
    isBookMarked: false,
  ),
  MoviesModel(
    id: 2,
    movieName: "Willy Wonka",
    description:
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war for its control.",
    rating: 8.7,
    numberOfPeopleRated: 1000000,
    imgUrl:
        "https://i.postimg.cc/R0933tbP/fergerger.jpg",
    isBookMarked: false,
  ),
  MoviesModel(
    id: 3,
    movieName: "Avengers",
    description:
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war for its control.",
    rating: 8.7,
    numberOfPeopleRated: 1000000,
    imgUrl:
        "https://i.postimg.cc/5026gVJL/download.jpg",
    isBookMarked: false,
  ),
  MoviesModel(
    id: 4,
    movieName: "The Matrix",
    description:
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war for its control.",
    rating: 8.7,
    numberOfPeopleRated: 1000000,
    imgUrl:
        "https://i.postimg.cc/XvcCxLCS/regrege.jpg",
    isBookMarked: false,
  ),
  MoviesModel(
    id: 5,
    movieName: "Willy Wonka",
    description:
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war for its control.",
    rating: 8.7,
    numberOfPeopleRated: 1000000,
    imgUrl:
        "https://i.postimg.cc/R0933tbP/fergerger.jpg",
    isBookMarked: false,
  ),
  MoviesModel(
    id: 6,
    movieName: "Avengers",
    description:
        "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war for its control.",
    rating: 8.7,
    numberOfPeopleRated: 1000000,
    imgUrl:
        "https://i.postimg.cc/5026gVJL/download.jpg",
    isBookMarked: false,
  ),
];
