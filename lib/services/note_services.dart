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
    ),
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

  //method to get notes from category
  Future<List<Note>> getNotesByCategoryName(String category) async {
    final dynamic allNotes = await _myBox.get('notes');
    final List<Note> notes = [];

    for (final note in allNotes) {
      if (note.category == category) {
        notes.add(note);
      }
    }
    return notes;
  }

  //edit a note
  Future<void> updateNote(Note note) async {
    try {
      final dynamic allNotes = await _myBox.get('notes');
      final int index = allNotes.indexWhere((e) => e.id == note);
      allNotes[index] = note;
      await _myBox.put('notes', allNotes);
    } catch (err) {
      print(err.toString());
    }
  }

  //method to delete a note
  Future<void> deleteNote(String noteID) async {
    try {
      final dynamic allNotes = await _myBox.get('notes');
      allNotes.removeWhere((e) => e.id == noteID);
      await _myBox.put('notes', allNotes);
    } catch (e) {
      print(e.toString());
    }
  }

  //method to get all cats
  Future<List<String>> getAllCategories() async {
    final List<String> categories = [];
    final dynamic allNotes = await _myBox.get('notes');

    for (final note in allNotes) {
      if (!categories.contains(note.category)) {
        categories.add(note.category);
      }
    }

    return categories;
  }
}
