import 'package:chat_app/chat.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<Story> stories = [
    Story(name: "Your story", imageUrl: "assets/images/1.jpg"),
    Story(name: "Maria Ford", imageUrl: "assets/images/2.jpg"),
    Story(name: "CNN", imageUrl: "assets/images/3.jpg"),
    Story(name: "KOKOU Amah", imageUrl: "assets/images/4.jpg"),
    Story(name: "AYEDAM Abalawoè", imageUrl: "assets/images/5.jpg"),
    Story(name: "TAN Doe", imageUrl: "assets/images/6.jpg"),
  ];

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "TalkTime",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        // Handle search button
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {
                        // Handle more options button
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(story.imageUrl),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          story.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 36.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    "All",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    "Personal",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    "News",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    "Work",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()))
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(chat.imageUrl),
                    ),
                    title: Text(
                      chat.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      chat.message,
                      style: TextStyle(
                        color: chat.isRead ? Colors.grey : Colors.white,
                      ),
                    ),
                    trailing: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chat.time,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                          chat.unreadCount != null
                              ? Container(
                                  margin: const EdgeInsets.only(top: 4.0),
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    chat.unreadCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(top: 4.0),
                                  padding: const EdgeInsets.all(6.0),
                                  child: const Icon(
                                    Icons.done_all,
                                    color: Colors.amber,
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C1C1E),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Story {
  final String name;
  final String imageUrl;

  Story({required this.name, required this.imageUrl});
}

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
