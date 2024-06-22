import 'package:flutter/material.dart';
import 'package:notesv2/helper/SQLhelper.dart';
import '../constant.dart';

class HomeView extends StatelessWidget {
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  final Sqldb sqldb = Sqldb();
  final TextEditingController mainTitleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  HomeView({super.key, required this.toggleTheme, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Note',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: mainTitleController,
                  decoration: const InputDecoration(
                    labelText: 'Main Title',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: subTitleController,
                  decoration: const InputDecoration(
                    labelText: 'Subtitle',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: noteController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Note',
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      InsetrFunctionToAddValus(
                        mainTitleController.text,
                        subTitleController.text,
                        noteController.text,
                      );
                      // Assuming TABLE_NAME is defined somewhere in your code
                      List<Map<String, dynamic>> response =
                          await sqldb.readData("SELECT * FROM $TABLE_NAME");
                      print('Read response: $response');

                      // Check if data meets a condition (example: response is not empty)
                      if (response.isNotEmpty) {
                        // Navigate to NotesView
                        Navigator.pushNamed(context, 'NotesView');
                      } else {
                        // Handle case where response is empty
                        print('No data available');
                      }
                    } catch (e) {
                      print('Error reading data: $e');
                    }
                  },
                  child: const Text('Add Note and Read Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
