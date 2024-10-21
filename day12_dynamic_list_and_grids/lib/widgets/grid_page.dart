import 'package:day12_dynamic_list_and_grids/models.dart';
import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  final List<Result> results;

  const GridPage({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return Card(
          child: GridTile(
            // footer: Text(item.overview),
            header: Image.network(
                'https://image.tmdb.org/t/p/w500${item.posterPath}'),
            child: Text(item.title),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
    );
  }
}
