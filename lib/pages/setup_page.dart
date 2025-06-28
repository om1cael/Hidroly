import 'package:flutter/material.dart';
import 'package:hidroly/controller/setup_controller.dart';
import 'package:hidroly/widgets/setup/setup_header.dart';
import 'package:hidroly/widgets/setup/setup_interactable.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff242530),
      ),
      backgroundColor: Color(0xff242530),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 64),
            child: Column(
              children: [
                SetupHeader(),
                SetupInteractable(),
                Text(
                  'Your data is stored on your device.',
                  style: TextStyle(
                    color: Color(0xffBEC0C5),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () {}, 
        icon: Icon(
          Icons.arrow_forward,
          color: Color(0xff1B1E26),
        ),
        style: IconButton.styleFrom(
          backgroundColor: Color(0xffF9F9F9)
        ),
        padding: EdgeInsets.all(18),
      ),
    );
  }
}