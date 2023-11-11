import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/Model/noteModel.dart';
import 'package:notesapp/screens/addNoteScreen.dart';
import 'package:notesapp/screens/editNoteScreen.dart';
import 'package:notesapp/screens/viewNoteScreen.dart';
import 'package:notesapp/service/noteProvider.dart';
import 'package:provider/provider.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteProvider>(context, listen: false).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = Provider.of<NoteProvider>(context).notes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) => Card(
            elevation: 10,
            child: ListTile(
              onTap: () {
                _viewNote(context, notes[index]);
              },
              title: Text(notes[index].title,style: TextStyle(color: Colors.yellow),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notes[index].content),
                  SizedBox(height: 5),
                  Text(
                    'Timestamp: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(notes[index].timestamp)}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit,color: Colors.yellow,),
                    onPressed: () {
                      _editNote(context, notes[index]);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete,color: Colors.yellow,),
                    onPressed: () {
                      _deleteNoteDialog(context, notes[index].id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[100],

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        child: Icon(Icons.add,color: Colors.black,),
      ),
    );
  }



  void _viewNote(BuildContext context, NoteModel note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewNoteScreen(note: note),
      ),
    );
  }

  void _editNote(BuildContext context, NoteModel note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(note: note),
      ),
    ).then((_) {
      // After returning from EditNoteScreen, update the UI
      Provider.of<NoteProvider>(context, listen: false).fetchNotes();
    });
  }

  void _deleteNoteDialog(BuildContext context, String noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Note'),
          content: Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<NoteProvider>(context, listen: false).deleteNote(noteId);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}