import 'package:flutter/material.dart';

class Note {
  final String selectedAbout;
  final String selectedReminder;
  final Color selectedColor;

  Note(
      {required this.selectedAbout,
      required this.selectedReminder,
      required this.selectedColor});
}
