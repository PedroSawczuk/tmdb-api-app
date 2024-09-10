import 'package:flutter/material.dart';
import 'package:tmdb_api_app/routes/appRoutes.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePage,
      routes: AppRoutes.define(),
    ),
  );
}
