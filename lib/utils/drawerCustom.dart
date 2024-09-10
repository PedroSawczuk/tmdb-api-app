import 'package:flutter/material.dart';
import 'package:tmdb_api_app/routes/appRoutes.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Filmes Populares'),
            leading: Icon(Icons.movie_creation_outlined),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.homePage);
            },
          ),
          ListTile(
            title: Text('Filmes Em Breve'),
            leading: Icon(Icons.upcoming),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.movieUpComingPage);
            },
          ),
          ListTile(
            title: Text('Filmes Famosos'),
            leading: Icon(Icons.trending_up),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.movieTrendingPage);
            },
          ),
        ],
      ),
    );
  }
}
