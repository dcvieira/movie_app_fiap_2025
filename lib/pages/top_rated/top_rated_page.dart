import 'package:flutter/material.dart';
import 'package:movie_app_fiap25/models/movie_model.dart';
import 'package:movie_app_fiap25/pages/top_rated/widgets/movei_card.dart';
import 'package:movie_app_fiap25/services/movie_services.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  MovieServices movieServices = MovieServices();
  late Future<Result> moviesFuture;

  @override
  void initState() {
    moviesFuture = movieServices.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Rated Movies')),
      body: FutureBuilder(
        future: moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            final movies = snapshot.data!.movies;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]);
              },
            );
          }

          return const Center(child: Text('No data found'));
        },
      ),
    );
  }
}
