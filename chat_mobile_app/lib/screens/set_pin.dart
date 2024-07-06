import 'package:chat_app/components/custom_keyboard.dart';
import 'package:chat_app/screens/chat_list.dart';
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
                color: Color(0xFFFCAc34),
                size: 48.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Set PIN",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
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
                fieldBackgroundColor: const Color(0xFF161616),
                fieldHeight: 60.0,
                fieldWidth: 50.0,
                activeBorderColor: Color(0xFFFCAc34),
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

