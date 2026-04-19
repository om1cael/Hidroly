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
            
                    Text('Migration', textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                    Text(
                      'We found app data from a previous version. Do you want to migrate your entire history and cups?',
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
                              title: Text('Are you sure?'),
                              content: Text('Your data will be backed up, but you may still lose it during this process. The migration will only happen once.'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: Text('No')),
                                FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ref.read(migrationViewModelProvider.notifier).startMigration();
                                  }, 
                                  child: Text('Proceed with it')),
                              ],
                            );
                          }
                        );
                      }, 
                      child: Text('Yes')
                    ),
                    TextButton(
                      onPressed: () async {
                        showDialog(
                          context: context, 
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Are you sure?'),
                              content: Text('You will not be able to migrate your data in the future.'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: Text('No')),
                                FilledButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    ref.read(migrationViewModelProvider.notifier).ignoreMigration();

                                    if(!context.mounted) return;
                                    context.go('/setup');
                                  }, 
                                  child: Text('Proceed with it')),
                              ],
                            );
                          }
                        );
                      },
                      child: Text('No, I want to start from scratch')
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
                    
                    Text('Processing', textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                    Text(
                      'Don\'t worry, it may take some time.',
                      textAlign: .center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                Column(
                  spacing: 12,
                  children: [
                    Text('Copying your data...'),
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
                    
                    Text('Done', textAlign: .center, style: Theme.of(context).textTheme.headlineLarge,),
                    Text(
                      'Your data has been migrated. Enjoy, and welcome again!',
                      textAlign: .center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                FilledButton(
                  onPressed: () {
                    // save flag?
                    context.go('/');
                  }, 
                  child: Text('Let\'s go!')
                ),
              ],
            ),
            error: (error) => Text(error),
          ),
        )
      ),
    );
  }
}