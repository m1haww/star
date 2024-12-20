import 'package:flutter/material.dart';

class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _notes = [
    {
      'title': 'Buy groceries',
      'description': 'Milk, eggs, bread, butter, and more...',
      'date': '2024-12-18',
    },
    {
      'title': 'Meeting with client',
      'description': 'Discuss the new project proposal and deadlines.',
      'date': '2024-12-19',
    },
    {
      'title': 'Doctor\'s appointment',
      'description': 'Annual checkup and health screening.',
      'date': '2024-12-20',
    },
    {
      'title': 'Guitar practice',
      'description': 'Practice new chords and songs for upcoming performance.',
      'date': '2024-12-21',
    },
    {
      'title': 'Finish Flutter project',
      'description': 'Complete the final touches on the app and test.',
      'date': '2024-12-22',
    },
  ];
  List<Map<String, String>> _filteredNotes = [];

  @override
  void initState() {
    super.initState();
    _filteredNotes = _notes;
  }

  void _filterNotes(String query) {
    setState(() {
      _filteredNotes = _notes
          .where((note) =>
              note['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8E6),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF8E6),
        title: const Text(
          'Search Notes',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFFEEA9),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterNotes,
                decoration: InputDecoration(
                  hintText: 'Search your notes...',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.deepPurple),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _filteredNotes.isEmpty ? 'No notes found' : 'Search Results',
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: _filteredNotes.isEmpty
                  ? const Center(
                      child: Text(
                        'No results match your search.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredNotes.length,
                      itemBuilder: (context, index) {
                        final note = _filteredNotes[index];
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: const Color(0xffFFEEA9),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16),
                                tileColor: Colors.white,
                                title: Text(
                                  note['title']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      note['description']!,
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Date: ${note['date']}',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () {
                                    setState(() {
                                      _notes.removeAt(index);
                                      _filteredNotes = _notes
                                          .where((note) => note['title']!
                                              .toLowerCase()
                                              .contains(_searchController.text
                                                  .toLowerCase()))
                                          .toList();
                                      showFinallConfirmation();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
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
}
