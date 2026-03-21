import 'package:flutter/material.dart';

class HydrationView extends StatelessWidget {
  const HydrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SizedBox(
                height: 280,
                width: 280,
                child: Stack(
                  alignment: .xy(0, 0),
                  children: [
                    SizedBox.expand(
                      child: CircularProgressIndicator(
                        value: .5,
                        strokeWidth: 16,
                        strokeCap: .round,
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Text('1200ml', style: Theme.of(context).textTheme.headlineLarge),
                        Text('of 2000ml', style: Theme.of(context).textTheme.bodyLarge,),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}