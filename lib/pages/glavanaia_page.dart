import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star/models/app_provider.dart';
import 'package:star/models/note.dart';
import 'package:star/pages/home_page.dart';
import 'package:star/pages/note_page.dart';
import 'package:star/pages/searching_page.dart';

class GlavanaiaPage extends StatefulWidget {
  const GlavanaiaPage({super.key});

  @override
  State<GlavanaiaPage> createState() => _GlavanaiaPageState();
}

class _GlavanaiaPageState extends State<GlavanaiaPage> {
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final notes = Provider.of<AppProvider>(context).Notes;

    return Scaffold(
      backgroundColor: const Color(0xffFCF596),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCF596),
        title: const Text("Search"),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.search),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchingPage(),
                  ));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Reminders",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: "Js",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: height * 0.02),
              const Text(
                "Pinned",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Js",
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: height * 0.02),
              notes.isEmpty
                  ? const Center(
                      child: Text(
                        "No reminders pinned.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Js",
                          fontSize: 16,
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(
                        "No reminders pinned.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Js",
                          fontSize: 16,
                        ),
                      ),
                    ),
              buildNoteList(notes, context),
            ],
          ),
        ),
      ),
    );
  }

  void showFinallConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.amber[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Text(
            "Are you sure you want to delete it?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.done, color: Colors.white),
                  label: const Text(
                    'Got it!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Expanded buildNoteList(List<Note> notes, BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                ListTile(
                  tileColor: note.selectedColor,
                  title: Text(
                    note.selectedAbout,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Js",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: note.isSaved
                            ? const Icon(
                                CupertinoIcons.bookmark_fill,
                                color: Colors.black,
                              )
                            : const Icon(
                                CupertinoIcons.bookmark,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          Provider.of<AppProvider>(context, listen: false)
                              .toggleSavedStatus(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<AppProvider>(context, listen: false)
                              .Notes
                              .removeAt(index);
                          Provider.of<AppProvider>(context, listen: false)
                              .notifyListeners();
                          showFinallConfirmation();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (note.isSaved)
                        const Text(
                          "Pinned",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Js",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      const SizedBox(height: 4),
                      // TextField for editing the reminder
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: TextEditingController(
                              text: note.selectedReminder),
                          decoration: InputDecoration(
                            hintText: "Edit your reminder",
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            prefixIcon: Icon(
                              Icons.edit,
                              color: Colors.blue.shade300,
                            ),
                          ),
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Js",
                              fontWeight: FontWeight.w500),
                          onChanged: (value) {
                            note.selectedReminder = value;
                            Provider.of<AppProvider>(context, listen: false)
                                .notifyListeners();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
