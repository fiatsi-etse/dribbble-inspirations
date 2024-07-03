import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(
        content:
            "Hey, I just finished implementing the new search feature. It should make finding products much easier for our users. Could you test it out and let me know if you encounter any issues?",
        isMe: true,
        time: "12:07"),
    Message(
        content:
            "Sure thing! I'll give it a go and provide you with feedback by the end of the day. Thanks for keeping me in the loop on the new feature.",
        isMe: false,
        time: "12:11"),
    Message(
        content:
            "Great, I appreciate your willingness to test it out. Let me know if you need any additional information or assistance while checking it.",
        isMe: true,
        time: "12:15"),
    Message(
        content: "Okay! Thanks, I'll text you 😊", isMe: false, time: "12:16"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Column(
                  children: [
                    Text(
                      "Judy Smith",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Secret chat",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.alarm, color: Colors.white),
                  onPressed: () {
                    // Handle info button
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageBubble(
                  message: message.content,
                  isMe: message.isMe,
                  time: message.time,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      filled: true,
                      fillColor: const Color(0xFF333333),
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.link),
                      suffixIcon: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.emoji_emotions),
                          Icon(Icons.mic)
                        ],
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8.0),
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.send, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String content;
  final bool isMe;
  final String time;

  Message({required this.content, required this.isMe, required this.time});
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;

  MessageBubble(
      {required this.message, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.amber : const Color(0xFF333333),
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: 250,
              padding: const EdgeInsets.all(12.0),
              child: isMe
                  ? Text(
                      message,
                      style: TextStyle(
                        color: isMe ? Colors.black : Colors.white,
                      ),
                    )
                  : Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(),
                        ),
                        Text(
                          message,
                          style: TextStyle(
                            color: isMe ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    )),
          const SizedBox(height: 5.0),
          Text(
            time,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
