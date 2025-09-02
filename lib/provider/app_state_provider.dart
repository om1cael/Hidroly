import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  bool _editMode = true;

  bool get editMode {
    return _editMode;
  }

  set editMode(bool value) {
    _editMode = value;
    notifyListeners();
  }
}