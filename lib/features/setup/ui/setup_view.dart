import 'package:flutter/material.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Age'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      )
                    ),
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    maxLength: 3,
                  ),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}