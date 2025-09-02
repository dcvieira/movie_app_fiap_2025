import 'package:flutter/material.dart';
import 'package:movie_app_fiap25/services/movie_services.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  MovieServices movieServices = MovieServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Top Rated Movies')));
  }
}
