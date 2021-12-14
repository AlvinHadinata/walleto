import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walleto/data/hive/note_boxes.dart';
import 'package:walleto/data/model/note.dart';
import 'package:walleto/screens/notes/note_add_page.dart';
import 'package:walleto/screens/notes/note_edit_page.dart';
import 'package:walleto/screens/widgets/animation_placeholder.dart';

import 'package:walleto/shared/theme.dart';

class NotePage extends StatefulWidget {
  static const routeName = '/notes_page';

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        title: Text('Catatanku', style: TextStyle(fontFamily: 'Nunito')),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          listNotes(context),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kBlueColor,
        onPressed: () {
          Navigator.pushNamed(context, NoteAddPage.routeName);
        },
      ),
    );
  }

  Widget listNotes(BuildContext context) {
    return ValueListenableBuilder<Box<Note>>(
      valueListenable: NoteBoxes.getNotes().listenable(),
      builder: (context, Box<Note> box, _) {
        if (box.values.isEmpty) {
          return AnimationPlaceholder(
            animation: "assets/no_data.svg",
            text: "Lets Make Some note",
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: box.values.take(5).length,
            itemBuilder: (context, index) {
              final note = box.getAt(index)!;
              return Dismissible(
                key: Key(index.toString()),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  NoteBoxes.deleteNote(index);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: kBlueColor,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      note.title,
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text(
                      note.description,
                      style: lightGreyTextStyle.copyWith(
                        fontSize: 14.0,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        NoteEditPage.routeName,
                        arguments: Note(
                          id: index,
                          title: note.title,
                          description: note.description,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
