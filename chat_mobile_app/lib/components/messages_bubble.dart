import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;
  final String imageUrl;
  final String sender;

  MessageBubble(
      {required this.message,
      required this.isMe,
      required this.time,
      required this.imageUrl,
      required this.sender});

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
                color: isMe ? Color(0xFFFCAc34) : const Color(0xFF161616),
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: 250,
              padding: const EdgeInsets.all(12.0),
              child: isMe
                  ? Column(
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                            color: isMe ? Colors.black : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                time,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Icon(Icons.done_all, color: Colors.black,)
                            ],
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(imageUrl),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(sender)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          message,
                          style: TextStyle(
                            color: isMe ? Colors.black : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                time,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.0,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              const Icon(Icons.done_all, color: Color(0xFFFCAc34),)
                            ],
                          ),
                        )
                      ],
                    )),
        ],
      ),
    );
  }
}
