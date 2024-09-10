import 'package:flutter/material.dart';
import 'package:tmdb_api_app/models/movieModel.dart';
import 'package:tmdb_api_app/routes/appRoutes.dart';
import 'package:tmdb_api_app/services/tmdbServices.dart';
import 'package:tmdb_api_app/utils/drawerCustom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TmdbServices _tmdbServices = TmdbServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(
        backgroundColor: Color(0xFF91140C),
        title: Text(
          'TMDB API APP',
          style: TextStyle(
            color: Color(0xFFF8F7F6),
          ),
        ),
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: _tmdbServices.fetchPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            return ListView.separated(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie.title),
                  subtitle: Text('Lançamento: ${movie.releaseDate}'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.movieDetailPage,
                      arguments: movie,
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          } else {
            return Center(child: Text('Nenhum dado disponível'));
          }
        },
      ),
    );
  }
}
