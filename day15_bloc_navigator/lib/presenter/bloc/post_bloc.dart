import 'package:day15_bloc_navigator/data/server/data_service.dart';
import 'package:day15_bloc_navigator/presenter/bloc/post_event.dart';
import 'package:day15_bloc_navigator/presenter/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _dataService = DataService();

  PostBloc() : super(LoadingPostState()) {
    on<PostEvent>(_posts);
  }

  void _posts(PostEvent event, Emitter<PostState> emit) async {
    if (event is LoadPostEvent || event is PullToRefreshEvent) {
      emit(LoadingPostState());
      try {
        final posts = await _dataService.posts();
        emit(LoadPostState(posts: posts));
      } catch (e) {
        emit(FailedPostState(message: e.toString()));
      }
    }
  }
}
