import 'package:flutter/material.dart';
import 'package:tmdb_api_app/views/homePage.dart';
import 'package:tmdb_api_app/views/movieUpComingPage.dart';
import 'package:tmdb_api_app/views/movieTrendingPage.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const movieUpComingPage = '/movieUpComingPage';
  static const movieTrendingPage = '/movieTrendingPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePage(),
      movieUpComingPage: (BuildContext context) => MovieUpComingPage(),
      movieTrendingPage: (BuildContext context) => MovieTrendingPage(),
    };
  }
}
