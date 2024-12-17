import 'package:flutter/cupertino.dart';
import 'package:star/models/note.dart';

class AppProvider extends ChangeNotifier {
  final List<Note> Notes = [];
  void addNote(Note notes) {
    Notes.add(notes);
    notifyListeners();
  }
}
