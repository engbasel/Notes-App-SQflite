// import 'package:flutter/material.dart';

// class NoteItem extends StatelessWidget {
//   final String noteTitle;
//   final String subtitle;
//   final String content;
//   final VoidCallback onEdit;
//   final VoidCallback onRemove;

//   const NoteItem({
//     super.key,
//     required this.noteTitle,
//     required this.subtitle,
//     required this.content,
//     required this.onEdit,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               noteTitle,
//               style: const TextStyle(
//                 color: Colors.blue,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 color: Colors.red,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               content,
//               style: const TextStyle(
//                 color: Colors.greenAccent,
//                 fontSize: 14,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.edit),
//                   onPressed: onEdit,
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.delete),
//                   onPressed: onRemove,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:notesv2/generated/l10n.dart';

class NoteItem extends StatelessWidget {
  final String noteTitle;
  final String subtitle;
  final String content;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  const NoteItem({
    super.key,
    required this.noteTitle,
    required this.subtitle,
    required this.content,
    required this.onEdit,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteTitle,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 14,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onRemove,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
