import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidroly/core/ui/view/health_connect_settings_card_view.dart';

class HealthConnectSettingsView extends StatelessWidget {
  final bool showExportButton;

  const HealthConnectSettingsView({
    super.key,
    this.showExportButton = true,
  });

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
                            Text('healthConnect'.tr(), style: Theme.of(context).textTheme.titleLarge,),
                            Text(
                              'healthConnectDescription'.tr(), 
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                              textAlign: .center,
                            ),
                          ],
                        )
                      ],
                    ),
                    HealthConnectSettingsCardView(showExportButton: showExportButton,),
                    TextButton(
                      onPressed: () => context.push("/privacy-policy"), 
                      child: Text("privacyPolicy".tr())
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