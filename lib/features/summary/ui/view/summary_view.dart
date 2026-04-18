import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/ui/extensions/unit_system_ui_extension.dart';
import 'package:hidroly/features/summary/ui/view_model/summary_view_model.dart';

class SummaryView extends ConsumerStatefulWidget {
  const SummaryView({super.key});

  @override
  ConsumerState<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends ConsumerState<SummaryView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(summaryViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          title: Text('Summary'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.local_drink)),
                  title: Text('totalDrunk'.tr()),
                  subtitle: Text('${data.totalDrunk.valueIn(data.unitSystem)} ${data.unitSystem.unitLabel}'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(24)),
                  tileColor: Theme.of(context).colorScheme.surfaceContainer,
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.water_drop)),
                  title: Text('dailyAverage'.tr()),
                  subtitle: Text('${data.dailyAverage.valueIn(data.unitSystem)} ${data.unitSystem.unitLabel}'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(24)),
                  tileColor: Theme.of(context).colorScheme.surfaceContainer,
                ),
                ListTile(
                  leading: CircleAvatar(backgroundColor: data.streak >= 1 ? Colors.redAccent : null, child: Icon(Icons.whatshot,)),
                  title: Text('streak'.tr()),
                  subtitle: Text('day'.plural(data.streak)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(24)),
                  tileColor: Theme.of(context).colorScheme.surfaceContainer,
                ),
              ],
            ),
          ),
        ),
      ),
      error: (_, _) => const Placeholder(),
      loading: () => CircularProgressIndicator(),
    );
  }
}