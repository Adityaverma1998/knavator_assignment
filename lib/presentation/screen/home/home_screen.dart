import 'package:flutter/material.dart';
import 'package:knavator_assignment/core/widgets/post_list_widget/post_list_widget.dart';
import 'package:knavator_assignment/data/enitity/post/post.dart';
import 'package:knavator_assignment/data/network/api_service.dart';
import 'package:knavator_assignment/data/storage/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late Future<List<Post>> _posts = Future.value([]);
  @override
  void initState() {
    super.initState();
    _fetchAndStorePosts();
  }

  void _fetchAndStorePosts() async {
    final apiService = ApiService();
    await apiService.fetchAndStorePosts();
    _reloadPosts();
  }

  void _reloadPosts() {
    setState(() {
      _posts = DBHelper.instance.getPosts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts available.'));
          }

          final posts = snapshot.data!;

          return ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostListWidget(post: post);
            },
            separatorBuilder: (context, index) {
              // Add spacing between items
              return SizedBox(height: 10);
            },
          );

        },
      ),
    );

  }
}


