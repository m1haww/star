import 'package:flutter/material.dart';

class Note {
  final String selectedAbout;
  late final String selectedReminder;
  final Color selectedColor;
  bool isSaved;

  Note({
    required this.selectedAbout,
    required this.selectedReminder,
    required this.selectedColor,
    this.isSaved = false,
  });
}
