import 'package:hive/hive.dart';
import 'package:walleto/data/model/note.dart';

class NoteBoxes {
  static Box<Note> getNotes() => Hive.box<Note>('notes');

  static void storeNote(Note note) {
    // Box<Note> noteBox = Hive.box<Note>("notes");

    // noteBox.add(note);
    getNotes().add(note);
  }

  static void updateNote(int index, Note note) {
    // Box<Note> noteBox = Hive.box<Note>("notes");
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
    // Box<Note> noteBox = Hive.box<Note>("notes");
    // noteBox.deleteAt(index);
    getNotes().deleteAt(index);
  }
}
