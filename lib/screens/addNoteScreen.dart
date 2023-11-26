import 'package:flutter/material.dart';
import 'package:notes_app/Model/noteModel.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/constants/customClass.dart';
import 'package:notes_app/service/noteProvider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  final NoteModel? note;

  AddNoteScreen({this.note});

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note != null ? 'Edit Note' : 'Add Note'),
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
                  primary: Colors.yellow, // Set the background color
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
    if (widget.note != null) {
      // Editing existing note
      Provider.of<NoteProvider>(context, listen: false).editNote(
        widget.note!.id,
        _titleController.text,
        _contentController.text,
      );
    } else {
      // Adding new note
      Provider.of<NoteProvider>(context, listen: false).addNote(
        _titleController.text,
        _contentController.text,
      );
    }
  }
}
