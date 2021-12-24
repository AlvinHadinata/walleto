import 'package:hive/hive.dart';
import 'package:walleto/data/model/note.dart';

class NoteBoxes {
  static Box<Note> getNotes() => Hive.box<Note>('notes');

  static void storeNote(Note note) {
    getNotes().add(note);
  }

  static void updateNote(int index, Note note) {
    getNotes().putAt(
      index,
      Note(
        id: note.id,
        title: note.title,
        description: note.description,
      ),
    );
  }

  static void deleteNote(int index) {
    getNotes().deleteAt(index);
  }
}
