import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:walleto/data/hive/note_boxes.dart';
import 'package:walleto/data/model/note.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

import 'note_page.dart';

class NoteEditPage extends StatefulWidget {
  static const routeName = "/note_edit_page";

  @override
  _NoteEditPageState createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final Note argument = ModalRoute.of(context)!.settings.arguments as Note;

      _titleController.text = argument.title;
      _descriptionController.text = argument.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Note argument = ModalRoute.of(context)!.settings.arguments as Note;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah catatanmu'),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    labelText: "Judul",
                    hintText: "Judul catatan",
                    keyboardType: TextInputType.text,
                    controller: _titleController,
                    maxLines: 1,
                    validator: (name) => name != null && name.isEmpty
                        ? 'Title tidak boleh kosong'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: "Deskripsi",
                    hintText: "Masukkan deskripsi",
                    keyboardType: TextInputType.multiline,
                    controller: _descriptionController,
                    maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: ElevatedButton(
                        child: Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kBlueColor,
                          minimumSize: Size.fromHeight(40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () async {
                          final isValid = _formKey.currentState!.validate();

                          if (isValid) {
                            Note note = Note(
                              title: _titleController.text,
                              description: _descriptionController.text,
                            );
                            NoteBoxes.updateNote(argument.id!, note);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              NotePage.routeName,
                              (Route<dynamic> route) => false,
                              arguments: true,
                            );
                          } else {
                            const Center(
                              child: SpinKitFadingCircle(
                                  color: kBlueColor, size: 30.0),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
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
