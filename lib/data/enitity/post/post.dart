import 'dart:math';

class Post {
  final String id;
  final String title;
  final String body;
  final int timerDuration;
  bool isRead;
  int remainingTime;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.timerDuration,
    this.isRead = false,
    int? remainingTime,
  }) : remainingTime = remainingTime ?? timerDuration;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'timerDuration': timerDuration,
    'isRead': isRead ? 1 : 0,
    'remainingTime': remainingTime,
  };

  static Post fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    body: '',
    timerDuration: json['timerDuration'],
    isRead: json['isRead'] == 1,
    remainingTime: json['remainingTime'],
  );

  static int generateRandomTimerDuration() {
    return [10, 20, 30][Random().nextInt(3)];
  }

  factory Post.createPostWithRandomTimer(String id, String title) {
    final timerDuration = generateRandomTimerDuration();
    return Post(id: id, title: title, body: '', timerDuration: timerDuration); // Empty body
  }
}
