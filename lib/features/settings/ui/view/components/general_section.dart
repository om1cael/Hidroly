import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/ui/extensions/unit_system_ui_extension.dart';
import 'package:hidroly/features/settings/ui/extensions/theme_mode_ui_extension.dart';
import 'package:hidroly/features/settings/ui/state/settings_state.dart';
import 'package:hidroly/features/settings/ui/view_model/settings_view_model.dart';

class SettingsGeneralSection extends ConsumerWidget {
  const SettingsGeneralSection({
    super.key,
    required this.data,
  });

  final SettingsState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.style),),
            title: Text('theme'.tr()),
            subtitle: Text(data.theme.label()),
            trailing: MenuAnchor(
              controller: MenuController(),
              menuChildren: <MenuItemButton>[
                MenuItemButton(
                  child: Text('system'.tr()),
                  onPressed: () => ref.read(settingsViewModelProvider.notifier).setTheme(ThemeMode.system),
                ),
                MenuItemButton(
                  child: Text('light'.tr()),
                  onPressed: () => ref.read(settingsViewModelProvider.notifier).setTheme(ThemeMode.light),
                ),
                MenuItemButton(
                  child: Text('dark'.tr()),
                  onPressed: () => ref.read(settingsViewModelProvider.notifier).setTheme(ThemeMode.dark),
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
            title: Text('unitSystem'.tr()),
            subtitle: Text(data.unitSystem.label),
            leading: CircleAvatar(child: Icon(Icons.straighten),),
            trailing: MenuAnchor(
              controller: MenuController(),
              menuChildren: <MenuItemButton>[
                MenuItemButton(
                  child: Text('metric'.tr()),
                  onPressed: () => ref.read(settingsViewModelProvider.notifier).setUnitSystem(UnitSystem.metric),
                ),
                MenuItemButton(
                  child: Text('imperial'.tr()),
                  onPressed: () => ref.read(settingsViewModelProvider.notifier).setUnitSystem(UnitSystem.imperial),
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
    );
  }
}