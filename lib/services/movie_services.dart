import 'package:dio/dio.dart';
import 'package:iti_project_movie_app/models/movies_model.dart';

class MovieServices {
  final Dio dio = Dio();

  Future<MoviesResponse?> fetchMovies() async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie",
        options: Options(
          headers: {
            "Content-Type": "Application/json",
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MzFkYmYzYWVlNzdhNTExODRiY2RjMmRmMTUzMTg3MiIsIm5iZiI6MTc1NzE1NzY0NC40NzUwMDAxLCJzdWIiOiI2OGJjMTkwY2I0YjQ3NDAwMGMxZjRkMzkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.7Bi2JToXDYFEJiy-LZDFmCj7VVj1fGxhjf93g7YSQsE",
          },
          responseType: ResponseType.json,
        ),

        queryParameters: {
          "api_key": "531dbf3aee77a51184bcdc2df1531872",
          "language": "en-US",
          "page": 1,
        },
      );

      if (response.statusCode == 200) {
        print("✅ API Response: ${response.data}");
        return MoviesResponse.fromJson(response.data);
      }

      print("⚠️ Unexpected status code: ${response.statusCode}");
      return null;
    } on DioException catch (e) {
      print("❌ Dio error: ${e.response?.data ?? e.message}");
      throw Exception(e.message);
    }
  }
}
