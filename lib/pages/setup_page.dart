import 'package:flutter/material.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/widgets/setup/setup_header.dart';
import 'package:hidroly/widgets/setup/setup_interactable.dart';
import 'package:provider/provider.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 64),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SetupHeader(),
                  SetupInteractable(
                    ageController: ageController,
                    weightController: weightController,
                  ),
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
        onPressed: () async {
          if(!formKey.currentState!.validate()) return;

          bool created = await context.read<DayProvider>().create(
            ageController.text,
            weightController.text,
          );

          if(created && context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            return;
          }
        },
        icon: Icon(
          Icons.arrow_forward,
        ),
        padding: EdgeInsets.all(18),
      ),
    );
  }
}