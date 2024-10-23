import 'package:day13_bloc_and_cubit/data_service.dart';
import 'package:day13_bloc_and_cubit/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostCubit() : super([]);

  void getPosts() async {
    emit(await _dataService.posts());
  }
}
