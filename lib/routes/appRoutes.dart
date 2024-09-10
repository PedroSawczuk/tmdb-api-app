import 'package:flutter/material.dart';
import 'package:tmdb_api_app/models/movieModel.dart';
import 'package:tmdb_api_app/views/homePage.dart';
import 'package:tmdb_api_app/views/movieUpComingPage.dart';
import 'package:tmdb_api_app/views/movieTrendingPage.dart';
import 'package:tmdb_api_app/views/movieDetailPage.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const movieUpComingPage = '/movieUpComingPage';
  static const movieTrendingPage = '/movieTrendingPage';
  static const movieDetailPage = '/movieDetailPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
      movieUpComingPage: (BuildContext context) => MovieUpComingPage(),
      movieTrendingPage: (BuildContext context) => MovieTrendingPage(),
      movieDetailPage: (BuildContext context) {
        final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;
        return MovieDetailPage(movie: movie);
      },
    };
  }
}