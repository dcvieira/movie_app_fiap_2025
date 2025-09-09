import 'package:flutter/material.dart';
import 'package:movie_app_fiap25/models/movie_model.dart';
import 'package:movie_app_fiap25/pages/home/widgets/custom_card_thumbnail.dart';

class NowPlayingList extends StatefulWidget {
  final List<Movie> movies;
  const NowPlayingList({super.key, required this.movies});

  @override
  State<NowPlayingList> createState() => _NowPlayingListState();
}

class _NowPlayingListState extends State<NowPlayingList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
            itemCount: widget.movies.length,
            itemBuilder: (context, index) {
              return CustomCardThumbnail(
                imageAsset: widget.movies[index].posterPath,
              );
            },
          ),
        ),
      ],
    );
  }
}
