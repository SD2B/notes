// EditNoteScreen.dart

import 'package:flutter/material.dart';
import 'package:notes_app/Model/noteModel.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/constants/customClass.dart';
import 'package:notes_app/service/noteProvider.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel note;

  EditNoteScreen({required this.note});

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note.title;
    _contentController.text = widget.note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: _titleController,
                labelText: 'Title',
                labelStyle: labelStyle,
                cursorColor: cursorColor,
                enabledBorder: enabledBoarder,
                focusedBorder: focusedBoarder,
                errorBorder: errorBoarder,
                focusedErrorBorder: focusedErrorBoarder,
              ),
              SizedBox(height: 16.0),
              CustomTextFormField(
                controller: _contentController,
                maxlines: null,
                labelText: 'Content',
                labelStyle: labelStyle,
                cursorColor: cursorColor,
                enabledBorder: enabledBoarder,
                focusedBorder: focusedBoarder,
                errorBorder: errorBoarder,
                focusedErrorBorder: focusedErrorBoarder,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _saveNote();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: maincolor, // Set the background color
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveNote() {
    // Editing existing note
    Provider.of<NoteProvider>(context, listen: false).editNote(
      widget.note.id,
      _titleController.text,
      _contentController.text,
    );
  }
}
