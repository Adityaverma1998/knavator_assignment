import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:knavator_assignment/data/enitity/post/post.dart';

class PostDetailsScreen extends StatefulWidget {
  final Post post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late Map<String,dynamic>  _postDetails;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchPostDetails();
  }

  // Function to fetch post details from API
  Future<void> _fetchPostDetails() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts/${int.parse(widget.post.id)}');
        print('check resposne are here ${response}');

        setState(() {
          _isLoading = false;
          _postDetails = response.data;
        });

    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Post Details'),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Post Details'),
        ),
        body: Center(child: Text(_errorMessage)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              _postDetails['body'],
              style: TextStyle(fontSize: 16),
            ),

          ],
        ),
      ),
    );
  }
}
