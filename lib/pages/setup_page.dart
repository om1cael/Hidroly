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
  SetupController setupController = SetupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 30.0, right: 30.0, bottom: 64),
            child: Form(
              key: setupController.formKey,
              child: Column(
                children: [
                  SetupHeader(),
                  SetupInteractable(setupController: setupController ,),
                  Text(
                    'Your data is stored on your device.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () => setupController.onSubmit(context),
        icon: Icon(
          Icons.arrow_forward,
        ),
        padding: EdgeInsets.all(18),
      ),
    );
  }
}