import 'package:flutter/material.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(48.0),
        child: Column(
          spacing: 64,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Column(
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'Let\'s set up your profile to personalize your daily water goal.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: .center,
                ),
              ],
            ),

            Form(
              child: Column(
                spacing: 24,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Age'),
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    maxLength: 3,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Weight'),
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
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