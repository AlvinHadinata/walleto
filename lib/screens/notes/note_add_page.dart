import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:walleto/data/hive/note_boxes.dart';
import 'package:walleto/data/model/note.dart';
import 'package:walleto/screens/home_page.dart';
import 'package:walleto/screens/notes/note_page.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

class NoteAddPage extends StatelessWidget {
  static const routeName = "/note_add_page";

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Tambah Catatanmu',
            style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 21)),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Judul",
                      hintText: "Masukkan judul",
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
                      hintText: "Masukan deskripsi",
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
                              NoteBoxes.storeNote(note);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomePage.routeName,
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
      ),
    );
  }
}
