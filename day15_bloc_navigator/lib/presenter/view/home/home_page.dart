import 'package:day15_bloc_navigator/presenter/bloc/post_bloc.dart';
import 'package:day15_bloc_navigator/presenter/bloc/post_event.dart';
import 'package:day15_bloc_navigator/presenter/bloc/post_state.dart';
import 'package:day15_bloc_navigator/presenter/nav/nav_cubit.dart';
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
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadPostState) {
            return RefreshIndicator(
                onRefresh: () async =>
                    context.read<PostBloc>().add(PullToRefreshEvent()),
                child: ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => context
                            .read<NavCubit>()
                            .showDetails(state.posts[index]),
                        title: Text(state.posts[index].title),
                      );
                    }));
          } else if (state is FailedPostState) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
