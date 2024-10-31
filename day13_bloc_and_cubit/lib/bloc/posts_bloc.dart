import 'package:day13_bloc_and_cubit/bloc/post_event.dart';
import 'package:day13_bloc_and_cubit/bloc/post_state.dart';
import 'package:day13_bloc_and_cubit/data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final DataService _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on<PostsEvent>(_getPosts);
  }

  void _getPosts(PostsEvent event, Emitter<PostsState> emit) async {
    if (event is LoadPostsEvent || event is PullToRefreshEvent) {
      emit(LoadingPostsState());
      try {
        final posts = await _dataService.posts();
        emit(LoadedPostsState(posts: posts));
      } catch (error) {
        emit(FailedToLoadPostsState(error: error.toString()));
      }
    }
  }
}
