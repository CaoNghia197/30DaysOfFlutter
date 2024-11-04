import 'package:day15_bloc_navigator/data/model/post.dart';

abstract class PostState {}

class LoadingPostState extends PostState {}

class LoadPostState extends PostState {
  final List<Post> posts;

  LoadPostState({required this.posts});
}

class FailedPostState extends PostState {
  final String message;

  FailedPostState({required this.message});
}
