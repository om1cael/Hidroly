import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          minimum: EdgeInsets.all(16),
          child: Column(
            spacing: 12,
            crossAxisAlignment: .start,
            children: [
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.local_drink)),
                title: Text('Total Drunk'),
                subtitle: Text(data.totalDrunk.toString() + ' ml'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(24)),
                tileColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.water_drop)),
                title: Text('Daily Average'),
                subtitle: Text(data.dailyAverage.toString() + ' ml'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(24)),
                tileColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
              ListTile(
                leading: CircleAvatar(backgroundColor: Colors.redAccent, child: Icon(Icons.whatshot,)),
                title: Text('Streak'),
                subtitle: Text(data.streak.toString() + ' days'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(24)),
                tileColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ],
          ),
        ),
      ),
      error: (_, _) => const Placeholder(),
      loading: () => CircularProgressIndicator(),
    );
  }
}