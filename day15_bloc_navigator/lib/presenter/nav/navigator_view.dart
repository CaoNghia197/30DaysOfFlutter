import 'package:day15_bloc_navigator/data/model/post.dart';
import 'package:day15_bloc_navigator/presenter/nav/nav_cubit.dart';
import 'package:day15_bloc_navigator/presenter/view/detailt/post_details.dart';
import 'package:day15_bloc_navigator/presenter/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorView extends StatelessWidget {
  const NavigatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(builder: (context, state) {
      return Navigator(
        pages: [
          const MaterialPage(child: HomePage()),
          if (state != null) MaterialPage(child: PostDetails(post: state))
        ],
        onPopPage: (router, result) => router.didPop(result),
      );
    });
  }
}
