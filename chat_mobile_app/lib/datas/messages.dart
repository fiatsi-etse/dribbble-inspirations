
class Message {
  final String content;
  final bool isMe;
  final String time;

  Message({required this.content, required this.isMe, required this.time});
}

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
