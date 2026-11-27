import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/ui/components/number_input_form_field.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/hydration/domain/entities/history_item.dart';
import 'package:hidroly/core/ui/extensions/unit_system_ui_extension.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';

class HistoryItemCard extends ConsumerWidget {
  const HistoryItemCard({
    super.key,
    required this.historyItem,
    required this.unitSystem,
    required this.animatedListKey,
  });

  final HistoryItem historyItem;
  final UnitSystem unitSystem;
  final GlobalKey<AnimatedListState> animatedListKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.filled(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.water_drop)),
        title: Text(
          'historyItemTitle'.tr(
            namedArgs: {
              'amount': historyItem.amount.valueIn(unitSystem).toString(),
              'unitLabel': unitSystem.unitLabel,
            },
          ),
        ),
        subtitle: Text(
          'historyItemSubtitle'.tr(
            namedArgs: {'time': DateFormat.jm().format(historyItem.createdAt)},
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'editHistoryItem'.tr(),
              onPressed: () => _editHistoryItem(context, ref),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                final historyList = ref
                    .read(hydrationViewModelProvider)
                    .requireValue
                    .history;
                final index = historyList.indexOf(historyItem);

                if (index == -1) return;

                animatedListKey.currentState?.removeItem(index, (
                  context,
                  animation,
                ) {
                  final offsetAnimation = animation.drive(
                    Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: const Offset(0, 0),
                    ).chain(CurveTween(curve: Curves.easeOut)),
                  );

                  return SlideTransition(
                    position: offsetAnimation,
                    child: HistoryItemCard(
                      historyItem: historyItem,
                      unitSystem: unitSystem,
                      animatedListKey: animatedListKey,
                    ),
                  );
                });

                await ref
                    .read(hydrationViewModelProvider.notifier)
                    .removeWater(historyItem.id, historyItem.amount.ml);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _editHistoryItem(BuildContext context, WidgetRef ref) async {
    final edit = await showModalBottomSheet<({int amount, DateTime createdAt})>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _HistoryItemEditSheet(
        historyItem: historyItem,
        unitSystem: unitSystem,
      ),
    );

    if (edit == null) return;

    await ref
        .read(hydrationViewModelProvider.notifier)
        .updateHistoryItem(historyItem.id, edit.amount, edit.createdAt);
  }
}

class _HistoryItemEditSheet extends StatefulWidget {
  const _HistoryItemEditSheet({
    required this.historyItem,
    required this.unitSystem,
  });

  final HistoryItem historyItem;
  final UnitSystem unitSystem;

  @override
  State<_HistoryItemEditSheet> createState() => _HistoryItemEditSheetState();
}

class _HistoryItemEditSheetState extends State<_HistoryItemEditSheet> {
  late final TextEditingController _amountController = TextEditingController(
    text: widget.historyItem.amount.valueIn(widget.unitSystem).toString(),
  );
  final _formKey = GlobalKey<FormState>();
  late TimeOfDay _selectedTime = TimeOfDay.fromDateTime(
    widget.historyItem.createdAt,
  );

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 12,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      child: Icon(Icons.water_drop_outlined, size: 28),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'editHistoryItem'.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'editHistoryItemDescription'.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                NumberInputFormField(
                  controller: _amountController,
                  label: 'historyItemAmount'.tr(),
                  suffix: widget.unitSystem.unitLabel,
                  maxLength: 9,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'inputRequired'.tr(
                        namedArgs: {'requiredInput': 'historyItemAmount'.tr()},
                      );
                    }

                    final amount = int.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'inputRequirement'.tr(
                        namedArgs: {'minValue': '1', 'maxValue': '999999999'},
                      );
                    }

                    return null;
                  },
                  autoFocus: true,
                ),
                const SizedBox(height: 16),
                Card.filled(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.schedule)),
                    title: Text('historyItemTime'.tr()),
                    subtitle: Text(_selectedTime.format(context)),
                    onTap: _selectTime,
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('cancel'.tr()),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.tonal(
                        onPressed: _save,
                        child: Text('save'.tr()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final historyItem = widget.historyItem;
    final updatedAt = DateTime(
      historyItem.createdAt.year,
      historyItem.createdAt.month,
      historyItem.createdAt.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );
    Navigator.pop(context, (
      amount: int.parse(_amountController.text),
      createdAt: updatedAt,
    ));
  }
}
