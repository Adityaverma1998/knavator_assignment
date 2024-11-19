class Post {
  final String id;
  final String title;
  final int timerDuration;
  bool isRead;
  int remainingTime;

  Post({
    required this.id,
    required this.title,
    required this.timerDuration,
    this.isRead = false,
    int? remainingTime,
  }) : remainingTime = remainingTime ?? timerDuration;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'timerDuration': timerDuration,
    'isRead': isRead,
    'remainingTime': remainingTime,
  };

  static Post fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    timerDuration: json['timerDuration'],
    isRead: json['isRead'],
    remainingTime: json['remainingTime'],
  );
}
