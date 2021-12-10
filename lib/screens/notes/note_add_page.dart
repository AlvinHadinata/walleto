import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walleto/data/model/note.dart';
import 'package:walleto/screens/widgets/custom_text_field.dart';
import 'package:walleto/shared/theme.dart';

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
            CustomTextField(
                labelText: "Title",
                hintText: "Masukan Title",
                controller: _titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title tidak boleh kosong';
                  }
                  return "";
                }),
            Expanded(
                child: CustomTextField(
              labelText: "Deskripsi",
              hintText: "Masukan Deskripsi",
              keyboardType: TextInputType.multiline,
              controller: _descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Deskripsi tidak boleh kosong';
                }
                return "";
              },
            )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: kBlueColor),
                child: Text('Simpan', style: TextStyle(fontFamily: 'Nunito')),
                onPressed: () {},
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
