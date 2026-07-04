import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state_management/post_cubit.dart';
import '../state_management/post_state.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("المـنـشـورات",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          // زر الجلب بتصميم عصري
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => context.read<PostCubit>().getPost(),
                child:
                    const Text("جلب البيانات", style: TextStyle(fontSize: 18)),
              ),
            ),
          ),

          // منطقة عرض البيانات
          BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }

              if (state is SuccessState) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: state.postModel.length,
                    itemBuilder: (context, index) {
                      final post = state.postModel[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(child: Text(post.id.toString())),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(post.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                              const Divider(height: 20),
                              Text(post.body,
                                  style: TextStyle(
                                      color: Colors.grey[700], height: 1.4)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              if (state is FailedState) {
                return Center(
                    child: Text(state.message,
                        style: const TextStyle(color: Colors.red)));
              }

              return const Center(child: Text("اضغط على الزر للبدء"));
            },
          )
        ],
      ),
    );
  }
}
