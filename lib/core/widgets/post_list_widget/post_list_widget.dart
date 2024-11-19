import 'dart:async';
import 'package:flutter/material.dart';
import 'package:knavator_assignment/data/enitity/post/post.dart';
import 'package:knavator_assignment/data/storage/db_helper.dart';
import 'package:knavator_assignment/presentation/screen/post_detail/post_details_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostListWidget extends StatefulWidget {
  final Post post;

  const PostListWidget({super.key, required this.post});

  @override
  _PostListWidgetState createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  late Timer _timer;
  int _remainingTime = 0;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.post.timerDuration;
  }

  void _startTimer() {
    if (_isTimerRunning) return;

    _isTimerRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _pauseTimer() {
    if (_isTimerRunning) {
      _isTimerRunning = false;
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    _pauseTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.post.id.toString()),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0) {
          _pauseTimer();
        } else {
          _startTimer();
        }
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
        title: Text(
          widget.post.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        subtitle: Text(
          widget.post.isRead ? 'Read' : 'Unread',
          style: TextStyle(
            color: widget.post.isRead ? Colors.green : Colors.red,
            fontStyle: FontStyle.italic,
          ),
        ),
        tileColor: widget.post.isRead ? Colors.white : Colors.yellow[100],
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.timer,
              color: Colors.blue,
              size: 20.0, // Icon size
            ),
            const SizedBox(width: 4.0),
            Text(
              'Timer: $_remainingTime sec',
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            widget.post.isRead = true;
            DBHelper.instance.insertPost(widget.post);
          });
          _pauseTimer();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailsScreen(post: widget.post),
            ),
          );
        },
      ),
    );
  }
}
