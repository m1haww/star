import 'package:flutter/material.dart';

class Note {
  final String selectedAbout;
  late final String selectedReminder;
  final Color selectedColor;
  late final bool isPinned;
  Note({
    required this.selectedAbout,
    required this.selectedReminder,
    required this.selectedColor,
    this.isPinned = false,
  });
}
