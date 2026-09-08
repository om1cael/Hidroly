import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidroly/core/ui/view/health_connect_settings_card_view.dart';

class HealthConnectSettingsView extends StatelessWidget {
  const HealthConnectSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  spacing: 32,
                  children: [
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      spacing: 24,
                      children: [
                        CircleAvatar(radius: 64, child: Icon(Icons.monitor_heart, size: 64,)),
                        Column(
                          children: [
                            Text('Health Connect', style: Theme.of(context).textTheme.titleLarge,),
                            Text(
                              'Hidroly can sync your data with Health Connect, so you can view and use them in other devices and apps', 
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                              textAlign: .center,
                            ),
                          ],
                        )
                      ],
                    ),
                    HealthConnectSettingsCardView(),
                    TextButton(
                      onPressed: () => context.push("/privacy-policy"), 
                      child: Text("Privacy Policy")
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}