import 'package:flutter/material.dart';
import 'package:tmdb_api_app/models/movieModel.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Color(0xFF91140C),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                movie.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Lançamento: ${movie.releaseDate}'),
              SizedBox(height: 10),
              Text('Avaliação: ${movie.voteAverage}'),
              SizedBox(height: 10),
              Text(
                movie.overview,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
