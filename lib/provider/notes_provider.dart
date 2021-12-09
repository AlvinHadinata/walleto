import 'package:flutter/material.dart';
import 'package:walleto/data/hive/database_helper.dart';
import 'package:walleto/data/model/note.dart';
import 'package:walleto/shared/const.dart';

class DbProvider extends ChangeNotifier {
  List<Note> _notes = [];
  late DatabaseHelper _dbHelper;

  List<Note> get notes => _notes;

  String _message = 'Tidak ada catatan';
  String get message => _message;

  ResultState _state = ResultState.NoData;
  ResultState get state => _state;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllNotes();
  }

  void _getAllNotes() async {
    _notes = await _dbHelper.getNotes();
    if (_notes.isNotEmpty) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Tidak ada catatan :(';
    }
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await _dbHelper.insertNote(note);
    _getAllNotes();
  }

  Future<Note> getNoteById(int id) async {
    return await _dbHelper.getNoteById(id);
  }

  void updateNote(Note note) async {
    await _dbHelper.updateNote(note);
    _getAllNotes();
  }

  void deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
    _getAllNotes();
  }
}
