import 'package:experience8/model/post_model.dart';

abstract class PostState {}

class InitialState extends PostState {}

class LoadingState extends PostState {}

class SuccessState extends PostState {
  final List<PostModel> postModel;
  final String message;
  SuccessState(this.postModel, this.message);
}

class FailedState extends PostState {
  final String message;
  FailedState(this.message);
}
