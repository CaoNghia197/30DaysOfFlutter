import 'package:day13_bloc_and_cubit/models/post.dart';

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post> posts;
  LoadedPostsState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  String error;
  FailedToLoadPostsState({required this.error});
}