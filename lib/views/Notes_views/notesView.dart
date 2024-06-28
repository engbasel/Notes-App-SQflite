// // import 'package:flutter/material.dart';
// // import 'package:notesv2/utils/NoteItem.dart';
// // import '../../utils/custom_snack_bar.dart';
// // import 'EditNoteScreen.dart';
// // import 'package:notesv2/generated/l10n.dart';
// // import '../../constant.dart';
// // import '../../helper/SQLhelper.dart';

// // class NotesView extends StatefulWidget {
// //   const NotesView({super.key});

// //   @override
// //   _NotesViewState createState() => _NotesViewState();
// // }

// // class _NotesViewState extends State<NotesView> {
// //   late Future<List<Map<String, dynamic>>> notesFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
// //   }

// //   Future<void> deleteNoteAndRefresh(int id) async {
// //     int response =
// //         await Sqldb().deleteData("DELETE FROM $TABLE_NAME WHERE id = $id");
// //     if (response > 0) {
// //       showCustomSnackBar(context, S.of(context).deleteSuccess);
// //       setState(() {
// //         notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
// //       });
// //     } else {
// //       showCustomSnackBar(context, S.of(context).deleteError);
// //     }
// //   }

// //   Future<void> navigateToEditNoteScreen(
// //       int id, String title, String subtitle, String content) async {
// //     bool? result = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => EditNoteScreen(
// //           id: id,
// //           initialTitle: title,
// //           initialSubtitle: subtitle,
// //           initialContent: content,
// //         ),
// //       ),
// //     );
// //     if (result == true) {
// //       setState(() {
// //         notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(S.of(context).notesTitle),
// //       ),
// //       body: FutureBuilder<List<Map<String, dynamic>>>(
// //         future: notesFuture,
// //         builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           } else if (snapshot.hasError) {
// //             return Center(
// //               child: Text('Error: ${snapshot.error}'),
// //             );
// //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //             return Center(
// //               child: Text(S.of(context).noDataAvailable),
// //             );
// //           } else {
// //             return ListView.builder(
// //               itemCount: snapshot.data!.length,
// //               itemBuilder: (context, index) {
// //                 String mainTitle = snapshot.data![index]['mainTitle'] ?? '';
// //                 String subTitle = snapshot.data![index]['subTitle'] ?? '';
// //                 String note = snapshot.data![index]['note'] ?? '';
// //                 int id = snapshot.data![index]['id'];
// //                 return NoteItem(
// //                   onEdit: () =>
// //                       navigateToEditNoteScreen(id, mainTitle, subTitle, note),
// //                   onRemove: () => deleteNoteAndRefresh(id),
// //                   noteTitle: mainTitle,
// //                   subtitle: subTitle,
// //                   content: note,
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart'; // Import the shimmer package
// import 'package:notesv2/utils/NoteItem.dart';
// import '../../utils/custom_snack_bar.dart';
// import 'EditNoteScreen.dart';
// import 'package:notesv2/generated/l10n.dart';
// import '../../constant.dart';
// import '../../helper/SQLhelper.dart';

// class NotesView extends StatefulWidget {
//   const NotesView({super.key});

//   @override
//   _NotesViewState createState() => _NotesViewState();
// }

// class _NotesViewState extends State<NotesView> {
//   late Future<List<Map<String, dynamic>>> notesFuture;

//   @override
//   void initState() {
//     super.initState();
//     notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
//   }

//   Future<void> deleteNoteAndRefresh(int id) async {
//     int response =
//         await Sqldb().deleteData("DELETE FROM $TABLE_NAME WHERE id = $id");
//     if (response > 0) {
//       showCustomSnackBar(context, S.of(context).deleteSuccess);
//       setState(() {
//         notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
//       });
//     } else {
//       showCustomSnackBar(context, S.of(context).deleteError);
//     }
//   }

//   Future<void> navigateToEditNoteScreen(
//       int id, String title, String subtitle, String content) async {
//     bool? result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditNoteScreen(
//           id: id,
//           initialTitle: title,
//           initialSubtitle: subtitle,
//           initialContent: content,
//         ),
//       ),
//     );
//     if (result == true) {
//       setState(() {
//         notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).notesTitle),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: notesFuture,
//         builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: ListView.builder(
//                   itemCount: 6,
//                   itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 8.0),
//                     child: Container(
//                       width: double.infinity,
//                       height: 80.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//               child: Text(S.of(context).noDataAvailable),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 String mainTitle = snapshot.data![index]['mainTitle'] ?? '';
//                 String subTitle = snapshot.data![index]['subTitle'] ?? '';
//                 String note = snapshot.data![index]['note'] ?? '';
//                 int id = snapshot.data![index]['id'];
//                 return NoteItem(
//                   onEdit: () =>
//                       navigateToEditNoteScreen(id, mainTitle, subTitle, note),
//                   onRemove: () => deleteNoteAndRefresh(id),
//                   noteTitle: mainTitle,
//                   subtitle: subTitle,
//                   content: note,
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:notesv2/utils/NoteItem.dart';
import '../../utils/NoteItemShimmer.dart';
import '../../utils/custom_snack_bar.dart';
import 'EditNoteScreen.dart';
import 'package:notesv2/generated/l10n.dart';
import '../../constant.dart';
import '../../helper/SQLhelper.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

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
      showCustomSnackBar(context, S.of(context).deleteSuccess);
      setState(() {
        notesFuture = Sqldb().readData("SELECT * FROM $TABLE_NAME");
      });
    } else {
      showCustomSnackBar(context, S.of(context).deleteError);
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
        title: Text(S.of(context).notesTitle),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: notesFuture,
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => const ShimmerNoteItem(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(S.of(context).noDataAvailable),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String mainTitle = snapshot.data![index]['mainTitle'] ?? '';
                String subTitle = snapshot.data![index]['subTitle'] ?? '';
                String note = snapshot.data![index]['note'] ?? '';
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
