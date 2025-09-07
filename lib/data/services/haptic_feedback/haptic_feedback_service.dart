import 'package:haptic_feedback/haptic_feedback.dart';

class HapticFeedbackService {
  Future<void> vibrate(HapticsType type) async {
    final canVibrate = await Haptics.canVibrate();
    if(!canVibrate) return;

    Haptics.vibrate(type);
  }
}