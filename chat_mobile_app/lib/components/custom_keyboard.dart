import 'package:chat_app/screens/chat_list.dart';
import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  final Function(String) onKeyboardTap;
  final VoidCallback onDeleteTap;

  CustomKeyboard({required this.onKeyboardTap, required this.onDeleteTap});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161616),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildNumberRow(["1", "2", "3"]),
          buildNumberRow(["4", "5", "6"]),
          buildNumberRow(["7", "8", "9"]),
          buildNumberRow(["", "0", "⌫"]),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatListScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFCAc34),
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              "Add PIN",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }

  Widget buildNumberRow(List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((number) {
        return number == "⌫"
            ? IconButton(
                icon:
                    const Icon(Icons.backspace, color: Color(0xFFFCAc34), size: 24),
                onPressed: widget.onDeleteTap,
              )
            : GestureDetector(
                onTap: () {
                  if (number.isNotEmpty) {
                    widget.onKeyboardTap(number);
                  }
                },
                child: Container(
                  width: 40.0,
                  height: 60.0,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: number.isEmpty
                        ? Colors.transparent
                        : const Color(0xFF161616),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    number,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: number.isEmpty ? Colors.transparent : Colors.white,
                    ),
                  ),
                ),
              );
      }).toList(),
    );
  }
}
