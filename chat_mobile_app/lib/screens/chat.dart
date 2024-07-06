import 'package:chat_app/components/messages_bubble.dart';
import 'package:chat_app/datas/chat.dart';
import 'package:chat_app/datas/messages.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  ChatScreen({required this.chat, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF161616),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.chat.name,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Text(
                      "Secret chat",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF161616),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    icon: const Icon(Icons.alarm, color: Colors.white),
                    onPressed: () {
                      // Handle info button
                    },
                  ),
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
                  sender: widget.chat.name,
                  imageUrl: widget.chat.imageUrl,
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
                      fillColor: const Color(0xFF161616),
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
                  backgroundColor: Color(0xFFFCAc34),
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
