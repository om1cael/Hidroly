import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/features/settings/ui/view/components/general_section.dart';
import 'package:hidroly/features/settings/ui/view_model/settings_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          title: Text('settings'.tr()),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  spacing: 6,
                  children: [
                    Center(
                      child: Column(
                        spacing: 4,
                        children: [
                          Text(
                            'Hidroly', 
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: .bold),
                            textAlign: .center,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                await launchUrl(Uri.parse('https://github.com/sponsors/om1cael'));
                              } catch (_) {
                                if(!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('errorOccurred'.tr(), textAlign: .center,),
                                    behavior: .floating,
                                    width: 250,
                                    backgroundColor: Theme.of(context).colorScheme.primary,
                                  ),
                                );
                              }
                            }, 
                            label: Text('buyMeACoffee'.tr()),
                            icon: Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 24,),
                
                    SettingsGeneralSection(data: data),
                  ],
                ),
              ),
            ),
          )
        ),
      ), 
      error: (e, _) => Text('Error'), 
      loading: () => Center(child: CircularProgressIndicator(),)
    );
  }
}