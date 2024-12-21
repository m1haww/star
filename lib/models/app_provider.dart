import 'package:flutter/cupertino.dart';
import 'package:star/models/note.dart'; // Import your Note model

class AppProvider extends ChangeNotifier {
  final List<Note> Notes = [];

  // Add note
  void addNote(Note note) {
    Notes.add(note);
    notifyListeners();
  }

  // Toggle the saved status of a note (similar to your desired functionality)
  void toggleSavedStatus(int index) {
    Notes[index].isSaved = !Notes[index].isSaved; // Toggle the saved status
    notifyListeners(); // Notify listeners to update the UI
  }
}
