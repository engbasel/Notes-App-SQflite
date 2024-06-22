// import 'package:flutter/material.dart';
// import '../helper/SQLhelper.dart';
// import '../constant.dart';

// class EditNoteScreen extends StatefulWidget {
//   final int id;
//   final String initialTitle;
//   final String initialSubtitle;
//   final String initialContent;

//   const EditNoteScreen({
//     super.key,
//     required this.id,
//     required this.initialTitle,
//     required this.initialSubtitle,
//     required this.initialContent,
//   });

//   @override
//   _EditNoteScreenState createState() => _EditNoteScreenState();
// }

// class _EditNoteScreenState extends State<EditNoteScreen> {
//   late TextEditingController titleController;
//   late TextEditingController subtitleController;
//   late TextEditingController contentController;

//   @override
//   void initState() {
//     super.initState();
//     titleController = TextEditingController(text: widget.initialTitle);
//     subtitleController = TextEditingController(text: widget.initialSubtitle);
//     contentController = TextEditingController(text: widget.initialContent);
//   }

//   Future<void> saveNote() async {
//     int response = await Sqldb().updateData(
//       '''
// UPDATE $TABLE_NAME SET
//       mainTitle = "${contentController.text}",
//       subTitle = "${subtitleController.text}",
//       note = "${titleController.text}"
//       WHERE id = ${widget.id}

//       ''',
//       [
//         titleController.text,
//         subtitleController.text,
//         contentController.text,
//         widget.id
//       ],
//     );
//     if (response > 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Note updated successfully')));
//       Navigator.pop(context, true); // Return true to indicate success
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Error updating note')));
//     }
//   }

//   @override
//   void dispose() {
//     titleController.dispose();
//     subtitleController.dispose();
//     contentController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Note'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: saveNote,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(labelText: 'Title'),
//             ),
//             TextField(
//               controller: subtitleController,
//               decoration: const InputDecoration(labelText: 'Subtitle'),
//             ),
//             TextField(
//               controller: contentController,
//               decoration: const InputDecoration(labelText: 'Content'),
//               maxLines: 4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:notesv2/generated/l10n.dart';
import '../helper/SQLhelper.dart';
import '../constant.dart';

class EditNoteScreen extends StatefulWidget {
  final int id;
  final String initialTitle;
  final String initialSubtitle;
  final String initialContent;

  const EditNoteScreen({
    super.key,
    required this.id,
    required this.initialTitle,
    required this.initialSubtitle,
    required this.initialContent,
  });

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    subtitleController = TextEditingController(text: widget.initialSubtitle);
    contentController = TextEditingController(text: widget.initialContent);
  }

  Future<void> saveNote() async {
    int response = await Sqldb().updateData('''
UPDATE $TABLE_NAME SET
      mainTitle = "${titleController.text}", 
      subTitle = "${subtitleController.text}", 
      note = "${contentController.text}" 
      WHERE id = ${widget.id}
      ''', Colors.accents);
    //   if (response > 0) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text(S.of(context).noteUpdatedSuccessfully)));
    //     Navigator.pop(context, true); // Return true to indicate success
    //   } else {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text(S.of(context).updateError)));
    //   }
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).editNoteTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration:
                  InputDecoration(labelText: S.of(context).mainTitleLabel),
            ),
            TextField(
              controller: subtitleController,
              decoration:
                  InputDecoration(labelText: S.of(context).subtitleLabel),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: S.of(context).noteLabel),
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
