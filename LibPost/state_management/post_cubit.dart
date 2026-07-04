
import 'package:experience8/state_management/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/post_repository.dart';

class PostCubit extends Cubit<PostState> {
  final RepositoryPost repositoryPost;
  PostCubit(this.repositoryPost) : super(InitialState());
  Future<dynamic> getPost() async {
    emit(LoadingState());
    try {
      final postModel = await repositoryPost.getPost();
      emit(SuccessState(postModel, "success"));
    } catch (e) {
      emit(FailedState(e.toString()));
      print(e);
    }
  }
}