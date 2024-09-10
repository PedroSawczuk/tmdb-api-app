import 'package:dio/dio.dart';
import 'package:tmdb_api_app/models/movieModel.dart';

class TmdbServices {
  final Dio _dio = Dio();

  static const apiKey = '22d8bf8a594425133da545f5638e7051';
  static const apiUrl = 'https://api.themoviedb.org/3';
  static const apiLang = 'pt-BR';

  Future<List<MovieModel>> fetchPopularMovies() async {
    const String trendPopularMoviesUrl =
        '$apiUrl/movie/popular?api_key=$apiKey&language=$apiLang';
    try {
      final response = await _dio.get(trendPopularMoviesUrl);
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Erro ao carregar filmes populares');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }

  Future<List<MovieModel>> fetchTrendingMovies() async {
    const String trendTrendingMoviesUrl =
        '$apiUrl/trending/movie/day?api_key=$apiKey&language=$apiLang';
    try {
      final response = await _dio.get(trendTrendingMoviesUrl);
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Erro ao ver filmes que estão populares');
      }
    } catch (e) {
        throw Exception('Erro!!! ${e}');
    }
  }

  // String trendTrendingMoviesUrl =
  //     '$apiUrl/trending/movie/day?api_key=$apiKey&language=$apiLang';
  // String trendUpcomingMoviesUrl =
  //     '$apiUrl/movie/upcoming?api_key=$apiKey&language=$apiLang';

  Future<List<MovieModel>> fetchUpComingMovies() async {
    const String trendUpcomingMoviesUrl =
        '$apiUrl/movie/upcoming?api_key=$apiKey&language=$apiLang';
    try {
      final response = await _dio.get(trendUpcomingMoviesUrl);
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Erro ao carregar filmes que serão lançados em breve!');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }
}
