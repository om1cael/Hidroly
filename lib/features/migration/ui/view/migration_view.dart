import 'package:flutter/material.dart';

class MigrationView extends StatelessWidget {
  const MigrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 32,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [            
              Column(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    child: Icon(Icons.sync, size: 64,)
                  ),
          
                  SizedBox(height: 8,),
          
                  Text('Migration', textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                  Text(
                    'We found app data from a previous version. Do you want to migrate your entire history and cups?',
                    textAlign: .center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              
              Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .stretch,
                children: [
                  FilledButton(onPressed: () {}, child: Text('Yes')),
                  TextButton(
                    onPressed: () {}, // TODO: Set flag or rename db file and go to setup
                    child: Text('No, I want to start from scratch')
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}