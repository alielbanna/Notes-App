import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  final List<Note> currentNotes = [];

  static Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: directory.path,
    );
  }

  Future<void> addNote(String noteText) async {
    final newNote = Note()..text = noteText;

    //save to  database
    await isar.writeTxn(() => isar.notes.put(newNote));

    //re- read from database
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    List<Note> fetchedNoted = await isar.notes.where().findAll();

    currentNotes.clear();
    currentNotes.addAll(fetchedNoted);
    notifyListeners();
  }

  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);

    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
