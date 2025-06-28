import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidroly/widgets/input/number_input_field.dart';
import 'package:hidroly/widgets/setup/setup_header.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff242530),
      ),
      backgroundColor: Color(0xff242530),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              children: [
                SetupHeader(),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      NumberInputField(label: 'Your age'),
                      NumberInputField(label: 'Your weight'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}