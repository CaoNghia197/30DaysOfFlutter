import 'package:day15_bloc_navigator/data/model/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<Post?> {
  NavCubit() : super(null);

  void showDetails(Post state) => emit(state);

  void hideDetailsPost() => emit(null);
}
