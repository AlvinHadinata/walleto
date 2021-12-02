import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walleto/data/notes/note_add_update.dart';
import 'package:walleto/provider/notes_provider.dart';
import 'package:walleto/shared/theme.dart';

class NotesPage extends StatelessWidget {
  static const routeName = '/notes_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatanku', style: TextStyle(fontFamily: 'Nunito')),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: [listNotes()]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kBlueColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteAddUpdatePage()));
        },
      ),
    );
  }

  Widget listNotes() {
    return Consumer<DbProvider>(
      builder: (context, provider, child) {
        final notes = provider.notes;
        return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Dismissible(
              key: Key(note.id.toString()),
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                provider.deleteNote(note.id!);
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: kBlueColor, width: 1)),
                child: ListTile(
                  title: Text(note.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        fontFamily: 'Nunito',
                      )),
                  subtitle: Text(note.description,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Nunito',
                      )),
                  onTap: () async {
                    final selectedNote = await provider.getNoteById(note.id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NoteAddUpdatePage(selectedNote);
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
