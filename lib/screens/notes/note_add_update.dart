import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walleto/data/model/note.dart';
import 'package:walleto/shared/theme.dart';

import '../../provider/notes_provider.dart';

class NoteAddUpdatePage extends StatefulWidget {
  final Note? note;

  NoteAddUpdatePage([this.note]);

  @override
  _NoteAddUpdatePageState createState() => _NoteAddUpdatePageState();
}

class _NoteAddUpdatePageState extends State<NoteAddUpdatePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
      _isUpdate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah catatanmu', style: TextStyle(fontFamily: 'Nunito')),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'Nunito',
              ),
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Judul',
              ),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'Nunito',
                ),
                maxLines: null,
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: kBlueColor),
                child: Text('Simpan', style: TextStyle(fontFamily: 'Nunito')),
                onPressed: () async {
                  if (!_isUpdate) {
                    final note = Note(
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    Provider.of<DbProvider>(context, listen: false)
                        .addNote(note);
                  } else {
                    final note = Note(
                      id: widget.note!.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    Provider.of<DbProvider>(context, listen: false)
                        .updateNote(note);
                  }
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
