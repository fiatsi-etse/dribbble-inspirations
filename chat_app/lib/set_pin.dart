import 'package:chat_app/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class SetPinScreen extends StatefulWidget {
  @override
  _SetPinScreenState createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  String _pin = "";

  void _onKeyboardTap(String value) {
    print("onkeyboard $value");
    setState(() {
      if (_pin.length < 4) {
        _pin += value;
      }
    });
    print("pin $_pin");
  }

  void _onDeleteTap() {
    setState(() {
      if (_pin.isNotEmpty) {
        _pin = _pin.substring(0, _pin.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top: 60.0, left: 8.0),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: IconButton(
            //       icon: const Icon(Icons.arrow_back, color: Colors.white),
            //       onPressed: () {
            //         // Handle back button
            //       },
            //     ),
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.only(top: 70.0, left: 8.0),
              child: Icon(
                Icons.lock,
                color: Colors.amber,
                size: 48.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Set PIN",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Please make up a PIN \n to protect the chat",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PinCodeFields(
                length: 4,
                controller: TextEditingController(text: _pin),
                onComplete: (output) {
                  setState(() {
                    _pin = output;
                  });
                },
                keyboardType:
                    TextInputType.none, // Disable the default keyboard
                borderColor: Colors.transparent,
                fieldBackgroundColor: const Color(0xFF333333),
                fieldHeight: 60.0,
                fieldWidth: 50.0,
                activeBorderColor: Colors.amber,
                borderWidth: 2.0,
                borderRadius: BorderRadius.circular(8.0),
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomKeyboard(
                onKeyboardTap: _onKeyboardTap,
                onDeleteTap: _onDeleteTap,
              ),
            ),
            // const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyboardTap;
  final VoidCallback onDeleteTap;

  CustomKeyboard({required this.onKeyboardTap, required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
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
              backgroundColor: Colors.amber,
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
                    const Icon(Icons.backspace, color: Colors.amber, size: 24),
                onPressed: onDeleteTap,
              )
            : GestureDetector(
                onTap: () {
                  if (number.isNotEmpty) {
                    onKeyboardTap(number);
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
                        : const Color(0xFF333333),
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
