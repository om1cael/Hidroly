import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidroly/features/migration/ui/state/migration_state.dart';
import 'package:hidroly/features/migration/ui/view_model/migration_view_model.dart';

class MigrationView extends ConsumerWidget {
  const MigrationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(migrationViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: state.when(
            initial: () => Column(
              spacing: 32,
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [            
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      child: Icon(Icons.sync, size: 64,)
                    ),
            
                    SizedBox(height: 8,),
            
                    Text('migration'.tr(), textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                    Text(
                      'oldAppDataFound'.tr(),
                      textAlign: .center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                
                Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .stretch,
                  children: [
                    FilledButton(
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (_) {
                            return AlertDialog(
                              title: Text('areYouSure'.tr()),
                              content: Text('migrationWarning'.tr()),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: Text('no'.tr())),
                                FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ref.read(migrationViewModelProvider.notifier).startMigration();
                                  }, 
                                  child: Text('proceed'.tr())),
                              ],
                            );
                          }
                        );
                      }, 
                      child: Text('yes'.tr())
                    ),
                    TextButton(
                      onPressed: () async {
                        showDialog(
                          context: context, 
                          builder: (_) {
                            return AlertDialog(
                              title: Text('areYouSure'.tr()),
                              content: Text('futureMigrationWarning'.tr()),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: Text('no'.tr())),
                                FilledButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    ref.read(migrationViewModelProvider.notifier).ignoreMigration();

                                    if(!context.mounted) return;
                                    context.go('/setup');
                                  }, 
                                  child: Text('proceed'.tr())),
                              ],
                            );
                          }
                        );
                      },
                      child: Text('scratchButton'.tr())
                    ),
                  ],
                )
              ],
            ),
            processing: () => Column(
              spacing: 32,
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [    
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      child: Icon(Icons.unarchive, size: 64,)
                    ), 

                    SizedBox(height: 12,),
                    
                    Text('processing'.tr(), textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                    Text(
                      'timeNeeded'.tr(),
                      textAlign: .center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                Column(
                  spacing: 12,
                  children: [
                    Text('copyingData'.tr()),
                    LinearProgressIndicator(),
                  ],
                )
              ],
            ), 
            done: () => Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              spacing: 16,
              children: [    
                Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      child: Icon(Icons.done, size: 64,)
                    ), 

                    SizedBox(height: 12,),
                    
                    Text('done'.tr(), textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                    Text(
                      'migrationSuccess'.tr(),
                      textAlign: .center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                FilledButton(
                  onPressed: () {
                    context.go('/');
                  }, 
                  child: Text('letsGo'.tr())
                ),
              ],
            ),
            error: (error) => Column(
              spacing: 32,
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [            
                Column(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.priority_high, size: 64,)
                    ),
            
                    SizedBox(height: 8,),
            
                    Text('sorry'.tr(), textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                    Text(
                      'migrationError'.tr(),
                      textAlign: .center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.surfaceContainer
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(error),
                    ),
                  ),
                ),
                
                Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .stretch,
                  children: [
                    FilledButton(
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (_) {
                            return AlertDialog(
                              title: Text('areYouSure'.tr()),
                              content: Text('migrationErrorRetry'.tr()),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: Text('no'.tr())),
                                FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ref.read(migrationViewModelProvider.notifier).startMigration();
                                  }, 
                                  child: Text('proceed'.tr())),
                              ],
                            );
                          }
                        );
                      }, 
                      child: Text('tryAgain'.tr())
                    ),
                    TextButton(
                      onPressed: () async {
                        showDialog(
                          context: context, 
                          builder: (_) {
                            return AlertDialog(
                              title: Text('areYouSure'.tr()),
                              content: Text('futureMigrationWarning'.tr()),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: Text('no'.tr())),
                                FilledButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    ref.read(migrationViewModelProvider.notifier).ignoreMigration();

                                    if(!context.mounted) return;
                                    context.go('/setup');
                                  }, 
                                  child: Text('proceed'.tr())),
                              ],
                            );
                          }
                        );
                      },
                      child: Text('scratchButton'.tr())
                    ),
                  ],
                )
              ]
            )
          ),
        )
      ),
    );
  }
}