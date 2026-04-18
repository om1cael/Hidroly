import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {},
                        ),
                        MenuItemButton(
                          child: Text('Light'),
                          onPressed: () {},
                        ),
                        MenuItemButton(
                          child: Text('Dark'),
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