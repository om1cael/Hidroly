import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  bool _editMode = false;

  bool get editMode {
    return _editMode;
  }

  set editMode(bool value) {
    _editMode = value;
    notifyListeners();
  }
}