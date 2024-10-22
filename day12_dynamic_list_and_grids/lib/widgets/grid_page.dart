import 'package:day12_dynamic_list_and_grids/models.dart';
import 'package:day12_dynamic_list_and_grids/widgets/item_movie_grid.dart';
import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  final List<Result> results;

  const GridPage({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ItemMovieGrid(result: results[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
    );
  }
}
