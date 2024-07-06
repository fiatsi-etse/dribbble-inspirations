class Chat {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isRead;
  final int? unreadCount;

  Chat(
      {required this.name,
      required this.message,
      required this.time,
      required this.imageUrl,
      required this.isRead,
      this.unreadCount});
}

final List<Chat> chats = [
    Chat(
        name: "Evelyn Foster",
        message: "Just finished a workout and feeling great!",
        time: "15:47",
        imageUrl: "assets/images/4.jpg",
        isRead: true),
    Chat(
        name: "Tom Mitchell",
        message: "Not yet, but I've made significant progress.",
        time: "13:02",
        imageUrl: "assets/images/5.jpg",
        isRead: false,
        unreadCount: 3),
    Chat(
        name: "Jackie Washington",
        message: "Just finished a workout and feeling great!",
        time: "13:02",
        imageUrl: "assets/images/1.jpg",
        isRead: false),
    Chat(
        name: "New York Times",
        message: "Dortmund try to outrun reality before...",
        time: "Yesterday",
        imageUrl: "assets/images/2.jpg",
        isRead: false,
        unreadCount: 9),
    Chat(
        name: "Mattie Moore",
        message: "You: Not yet, but I've heard it's a really...",
        time: "28 May",
        imageUrl: "assets/images/3.jpg",
        isRead: true),
  ];