import 'package:day13_bloc_and_cubit/bloc/post_cubit.dart';
import 'package:day13_bloc_and_cubit/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: BlocBuilder<PostCubit, List<Post>>(
          builder: (_, posts) {
            if (posts.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(posts[index].title),
              );
            });
          },
        ));
  }
}
