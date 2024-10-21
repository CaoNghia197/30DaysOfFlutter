import 'package:day12_dynamic_list_and_grids/models.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<Result> results;

  const ListPage({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final item = results[index];
          return Card(
            child: ListTile(
              title: Text(item.title),
              subtitle: Text(item.overview,
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              leading: Image.network(
                'https://image.tmdb.org/t/p/w500${item.posterPath}',
                width: 100,
                fit: BoxFit.cover,
              ),
              onTap: () {},
            ),
          );
        });
  }
}
