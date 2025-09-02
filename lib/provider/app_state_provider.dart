import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  bool _editMode = false;
  set editMode (bool value) {
    _editMode = value;
  }
}