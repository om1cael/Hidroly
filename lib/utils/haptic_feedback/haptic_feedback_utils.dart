import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class HapticFeedbackUtils {
  final BuildContext context;

  const HapticFeedbackUtils({
    required this.context,
  });

  Future<void> vibrate(HapticsType type) async {
    final canVibrate = await Haptics.canVibrate();

    if(!context.mounted) return;
    final hapticEnabled = context.read<SettingsProvider>().hapticFeedback;
    
    if(!canVibrate || !hapticEnabled) return;

    Haptics.vibrate(type);
  }
}