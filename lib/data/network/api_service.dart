import 'package:dio/dio.dart';
import 'package:knavator_assignment/data/enitity/post/post.dart';
import 'package:knavator_assignment/data/storage/db_helper.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );

  Future<void> fetchAndStorePosts() async {
    try {
      final response = await _dio.get('/posts');
      final posts = response.data as List;

      await DBHelper.instance.clearTable();

      for (var post in posts) {
        final postModel = Post.createPostWithRandomTimer(
          post['id'].toString(),
          post['title'],
        );
        await DBHelper.instance.insertPost(postModel);
      }
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }
}
