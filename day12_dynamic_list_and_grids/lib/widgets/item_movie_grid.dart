import 'package:day12_dynamic_list_and_grids/models.dart';
import 'package:flutter/material.dart';

class ItemMovieGrid extends StatelessWidget {
  final Result result;

  const ItemMovieGrid({super.key, required this.result});

  /*
  * https://image.tmdb.org/t/p/w500${result.posterPath}
  * */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
                'https://image.tmdb.org/t/p/w500${result.posterPath}'),
          ),
          Text(
            result.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          ),
          Text(
            result.releaseDate.toString().split(' ').first.toString(),
            style: const TextStyle(
              fontSize: 8,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
