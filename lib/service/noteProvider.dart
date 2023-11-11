

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/Model/noteModel.dart';

class NoteService {
  CollectionReference _notesCollection = FirebaseFirestore.instance.collection('notes');
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  Future<void> addNote(String title, String content) async {
    try {
      await _notesCollection.add({
        'title': title,
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      notifyListeners();
    } catch (error) {
      print('Error adding note: $error');
      // Handle the error as needed
    }
  }

  Future<void> editNote(String noteId, String title, String content) async {
    try {
      await _notesCollection.doc(noteId).update({
        'title': title,
        'content': content,
      });
      notifyListeners();
    } catch (error) {
      print('Error editing note: $error');
      // Handle the error as needed
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await _notesCollection.doc(noteId).delete();
      notifyListeners();
    } catch (error) {
      print('Error deleting note: $error');
      // Handle the error as needed
    }
  }


  Future<void> fetchNotes() async {
    try {
      final notes = await _notesCollection.get();
      _notes = notes.docs.map((doc) => NoteModel.fromSnapshot(doc)).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching notes: $error');
      // Handle the error as needed
    }
  }

  void notifyListeners() {} // Add this method to resolve the notifyListeners issue
}

class NoteProvider extends ChangeNotifier {
  List<NoteModel> _notes = [];
  NoteService _noteService = NoteService();

  List<NoteModel> get notes => _notes;

  void addNote(String title, String content) async {
    await _noteService.addNote(title, content);
    await fetchNotes(); // Refresh the notes list after adding a new note
  }
  void editNote(String noteId, String title, String content) async {
    await _noteService.editNote(noteId, title, content);
    await fetchNotes(); // Refresh the notes list after editing a note
  }

  void deleteNote(String noteId) async {
    await _noteService.deleteNote(noteId);
    await fetchNotes(); // Refresh the notes list after deleting a note
  }

  Future<void> fetchNotes() async {
    await _noteService.fetchNotes();
    _notes = _noteService.notes;
    notifyListeners();
  }
}

