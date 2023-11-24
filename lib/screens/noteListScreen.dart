import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/Model/noteModel.dart';
import 'package:notesapp/constants/constants.dart';
import 'package:notesapp/constants/customClass.dart';
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
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NoteProvider>(context, listen: false).fetchNotes();
  }

  List<NoteModel> getFilteredNotes(List<NoteModel> notes, String query) {
    if (query.isEmpty) {
      return notes;
    } else {
      return notes
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = Provider.of<NoteProvider>(context).notes;
    List<NoteModel> filteredNotes =
        getFilteredNotes(notes, _searchController.text);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: CustomTextFormField(
              controller: _searchController,
              onChanged: (_) {
                setState(() {}); // Trigger rebuild when the text changes
              },
              labelText: 'Search',
              labelStyle: labelStyle,
              cursorColor: cursorColor,
              enabledBorder: enabledBoarder,
              focusedBorder: focusedBoarder,
              errorBorder: errorBoarder,
              focusedErrorBorder: focusedErrorBoarder,
              suffixIcon: _searchController.text.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(
                              () {}); // Trigger rebuild when the clear icon is pressed
                        },
                        icon: const Icon(Icons.close),
                      ),
                    )
                  : null,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: filteredNotes.length,
                itemBuilder: (context, index) => Slidable(
                  key: ValueKey(filteredNotes[index].id),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          _editNote(context, filteredNotes[index]);
                        },
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.yellow,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          _deleteNoteDialog(context, filteredNotes[index].id);
                        },
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        _viewNote(context, filteredNotes[index]);
                      },
                      title: Text(
                        filteredNotes[index].title,
                        style: const TextStyle(color: Colors.yellow),
                      ),
                      subtitle: Text(
                        filteredNotes[index].content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            DateFormat('yyyy-MM-dd')
                                .format(filteredNotes[index].timestamp),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(
                            DateFormat('hh:mm a')
                                .format(filteredNotes[index].timestamp),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[100],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
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
      Provider.of<NoteProvider>(context, listen: false).fetchNotes();
    });
  }

  void _deleteNoteDialog(BuildContext context, String noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Note'),
          content: const Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<NoteProvider>(context, listen: false)
                    .deleteNote(noteId);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

// ... (CustomTextFormField, NoteProvider, and other imports)
