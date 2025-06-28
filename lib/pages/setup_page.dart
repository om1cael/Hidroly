import 'package:flutter/material.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SetupHeader(),
            ],
          ),
        ),
      ),
    );
  }
}