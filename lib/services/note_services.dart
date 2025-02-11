import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_sphere/models/note_model.dart';
import 'package:uuid/uuid.dart';

class NoteService {
  List<Note> allNotes = [
    Note(
      id: const Uuid().v4(),
      title: "Meet Notes",
      category: "Personal",
      content:
          'Welcome to Notes. This app helps you quickly jot down ideas, to-do lists, and reminders. Tap the plus button to create a new note, swipe left to delete, and use the search function to find notes easily.',
      date: DateTime.now(),
    )
  ];

  //create db ref
  final _myBox = Hive.box('notes');

  //check weather user is new
  Future<bool> isNewUser() async {
    return _myBox.isEmpty;
  }

  //methode to create initial notes if user is new
  Future<void> createInitialNotes() async {
    if (_myBox.isEmpty) {
      await _myBox.put('notes', allNotes);
    }
  }

  //load notes
  Future<List<Note>> loadNotes() async {
    final notes = await _myBox.get('notes');

    if (notes != null && notes is List<dynamic>) {
      return notes.cast<Note>().toList();
    }

    return [];
  }

  //catagorrize notes
  Map<String, List<Note>> getNotesByCategoryMap(List<Note> allNotes) {
    final Map<String, List<Note>> notesByCategory = {};

    for (final note in allNotes) {
      if (notesByCategory.containsKey(note.category)) {
        notesByCategory[note.category]!.add(note);
      } else {
        notesByCategory[note.category] = [note];
      }
    }
    return notesByCategory;
  }
}
