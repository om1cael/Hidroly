import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/providers/theme_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          spacing: 6,
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
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
                    onPressed: () {}, 
                    label: Text('Buy me a coffee'),
                    icon: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24,),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Icon(Icons.style),),
                    title: Text('Theme'),
                    subtitle: Text('System'),
                    trailing: MenuAnchor(
                      controller: MenuController(),
                      menuChildren: <MenuItemButton>[
                        MenuItemButton(
                          child: Text('System'),
                          onPressed: () => ref.read(themeProviderProvider.notifier).setTheme(ThemeMode.system),
                        ),
                        MenuItemButton(
                          child: Text('Light'),
                          onPressed: () => ref.read(themeProviderProvider.notifier).setTheme(ThemeMode.light),
                        ),
                        MenuItemButton(
                          child: Text('Dark'),
                          onPressed: () => ref.read(themeProviderProvider.notifier).setTheme(ThemeMode.dark),
                        ),
                      ],
                      builder: (_, controller, _) {
                        return IconButton(
                          onPressed: () {
                            controller.isOpen
                            ? controller.close()
                            : controller.open();
                          }, 
                          icon: controller.isOpen
                            ? Icon(Icons.arrow_drop_up)
                            : Icon(Icons.arrow_drop_down),
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Language'),
                    subtitle: Text('English (US)'),
                    leading: CircleAvatar(child: Icon(Icons.language),),
                  ),
                  ListTile(
                    title: Text('Unit System'),
                    subtitle: Text('Metric'),
                    leading: CircleAvatar(child: Icon(Icons.straighten),),
                    trailing: MenuAnchor(
                      controller: MenuController(),
                      menuChildren: <MenuItemButton>[
                        MenuItemButton(
                          child: Text('Metric (kg, ml)'),
                          onPressed: () {},
                        ),
                        MenuItemButton(
                          child: Text('Imperial (lb, oz)'),
                          onPressed: () {},
                        ),
                      ],
                      builder: (_, controller, _) {
                        return IconButton(
                          onPressed: () {
                            controller.isOpen
                            ? controller.close()
                            : controller.open();
                          }, 
                          icon: controller.isOpen
                            ? Icon(Icons.arrow_drop_up)
                            : Icon(Icons.arrow_drop_down),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}