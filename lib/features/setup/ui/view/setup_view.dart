import 'package:flutter/material.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';
import 'package:hidroly/features/setup/ui/view/widgets/header_text.dart';
import 'package:hidroly/features/setup/ui/view/widgets/number_input_form_field.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(48.0),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: 64,
                crossAxisAlignment: .center,
                children: [
                  const Spacer(flex: 2,),

                  HeaderText(
                    title: 'Welcome',
                    subtitle: 'Let\'s set up your profile to personalize your daily water goal.',
                  ),

                  Form(
                    child: Column(
                      spacing: 24,
                      children: [
                        NumberInputFormField(
                          label: 'Age',
                          maxLength: 3,
                          validator: (value) {},
                        ),
                        NumberInputFormField(
                          label: 'Weight',
                          suffix: 'kg',
                          maxLength: 3,
                          validator: (value) {},
                        ),
                        SegmentedButton(
                          segments: [
                            ButtonSegment(
                              label: Text('Metric'),
                              value: UnitSystem.metric
                            ),
                            ButtonSegment(
                              label: Text('Imperial'),
                              value: UnitSystem.imperial
                            ),
                          ], 
                          selected: {UnitSystem.metric},
                          onSelectionChanged: (newSelection) {
                            // TODO: Change selected segment
                          },
                        ),
                      ],
                    )
                  ),

                  Text('Your data never leaves your device.'),

                  const Spacer(),
                ],
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}