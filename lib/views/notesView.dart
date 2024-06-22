import 'package:flutter/material.dart';
import 'package:notesv2/views/NoteItem.dart';
import 'EditNoteScreen.dart';
import '../constant.dart';
import '../helper/SQLhelper.dart'; // Make sure you have constants defined here

class NotesView extends StatefulWidget {
  const NotesView({super.key}); // Corrected constructor syntax

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late Future<List<Map<String, dynamic>>> notesFuture;

  @override
  void initState() {
    super.initState();
    notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
  }

  Future<void> deleteNoteAndRefresh(int id) async {
    int response =
        await Sqldb().deleteData("DELETE FROM $TABLE_NAME WHERE id = $id");
    if (response > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Note deleted successfully')));
      setState(() {
        notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error deleting note')));
    }
  }

  Future<void> navigateToEditNoteScreen(
      int id, String title, String subtitle, String content) async {
    bool? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(
          id: id,
          initialTitle: title,
          initialSubtitle: subtitle,
          initialContent: content,
        ),
      ),
    );
    if (result == true) {
      setState(() {
        notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: notesFuture, // Using the state variable for the future
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available.'),
            );
          } else {
            // Display fetched data
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // Example of how to access and display data, adjust according to your database schema
                String mainTitle = snapshot.data![index]['mainTitle'] ?? '';
                String subTitle = snapshot.data![index]['note'] ?? '';
                String note = snapshot.data![index]['subTitle'] ?? '';
                int id = snapshot.data![index]['id'];

                return NoteItem(
                  onEdit: () =>
                      navigateToEditNoteScreen(id, mainTitle, subTitle, note),
                  onRemove: () => deleteNoteAndRefresh(id),
                  noteTitle: mainTitle,
                  subtitle: subTitle,
                  content: note,
                );
              },
            );
          }
        },
      ),
    );
  }
}
