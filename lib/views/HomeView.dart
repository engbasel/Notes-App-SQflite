import 'package:flutter/material.dart';
import 'package:notesv2/helper/SQLhelper.dart';
import 'package:notesv2/generated/l10n.dart';
import '../constant.dart';

class HomeView extends StatelessWidget {
  final VoidCallback? toggleTheme;
  final ThemeMode? themeMode;
  final void Function(Locale)? setLocale;
// --------------------------------------------------------------------------
  final Sqldb sqldb = Sqldb();
  final TextEditingController mainTitleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
// --------------------------------------------------------------------------
  HomeView({
    super.key,
    this.toggleTheme,
    this.themeMode,
    this.setLocale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).noteAppTitle),
        actions: [
// --------------------------------------------------------------------------
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: toggleTheme,
          ),
// --------------------------------------------------------------------------
          PopupMenuButton<Locale>(
            onSelected: setLocale,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<Locale>(
                  value: const Locale('en'),
                  child: Text(S.of(context).english),
                ),
                PopupMenuItem<Locale>(
                  value: const Locale('ar'),
                  child: Text(S.of(context).arabic),
                ),
              ];
            },
          ),
// --------------------------------------------------------------------------
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
                // --------------------------------------------------------------------------
                Text(
                  S.of(context).addNoteTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                // --------------------------------------------------------------------------
                const SizedBox(height: 16),
                // --------------------------------------------------------------------------
                TextFormField(
                  controller: mainTitleController,
                  decoration: InputDecoration(
                    labelText: S.of(context).mainTitleLabel,
                  ),
                ),
                // --------------------------------------------------------------------------
                const SizedBox(height: 16),
                // --------------------------------------------------------------------------
                TextFormField(
                  controller: subTitleController,
                  decoration: InputDecoration(
                    labelText: S.of(context).subtitleLabel,
                  ),
                ),
                // --------------------------------------------------------------------------
                const SizedBox(height: 16),
                // --------------------------------------------------------------------------
                TextFormField(
                  controller: noteController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: S.of(context).noteLabel,
                  ),
                ),
                // --------------------------------------------------------------------------
                const SizedBox(height: 32),
                // --------------------------------------------------------------------------
                ElevatedButton(
                  onPressed: () async {
                    try {
                      InsetrFunctionToAddValus(
                        mainTitleController.text,
                        subTitleController.text,
                        noteController.text,
                      );
                      List<Map<String, dynamic>> response =
                          await sqldb.readData("SELECT * FROM $TABLE_NAME");
                      print('Read response: $response');

                      if (response.isNotEmpty) {
                        // Clear the text fields
                        mainTitleController.clear();
                        subTitleController.clear();
                        noteController.clear();

                        Navigator.pushNamed(context, 'NotesView');
                      } else {
                        print('No data available');
                      }
                    } catch (e) {
                      print('Error reading data: $e');
                    }
                  },
                  child: Text(S.of(context).addNoteButton),
                ),
                // --------------------------------------------------------------------------
                const SizedBox(height: 20),
                // --------------------------------------------------------------------------
                ElevatedButton(
                  child: Text(S.of(context).ViewYourNotes),
                  onPressed: () async {
                    try {
                      Navigator.pushNamed(context, 'NotesView');
                    } catch (e) {}
                  },
                ),
                // --------------------------------------------------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
