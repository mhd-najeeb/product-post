import 'package:experience8/model/post_model.dart';

import '../services/api_services.dart';

class RepositoryPost {
  final ApiServices apiServices;
  RepositoryPost(this.apiServices);
  Future<List<PostModel>> getPost() async {
    final List<dynamic> jsonList = await apiServices.getPoste();
    return jsonList.map((json) => PostModel.fromJson(json)).toList();
  }
  // ارسال
  // Future<List<Map<String, dynamic>>> sendPost(List<PostModel> postModel) async {
  //   final List<dynamic> body=postModel.map((e) => e.toJson()).toList();
  //   return await apiServices.sendPost(body);
  // }
}
