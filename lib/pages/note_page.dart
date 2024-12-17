import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  String selectedAbout = "";
  String selectedReminder = "";
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFFF8E6),
      appBar: AppBar(
        backgroundColor: const Color(0xffC4B319),
        centerTitle: true,
        title: const Text(
          "Choose option",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("About"),
              _buildOptions(
                ["Work", "Study", "Events", "Others"],
                (option) => _showConfirmationDialog(option, "about"),
              ),
              _buildDynamicContainer("About", selectedAbout),
              _buildSectionTitle("Reminder"),
              _buildOptions(
                ["Today", "Tomorrow", "Week", "Month"],
                (option) => _showConfirmationDialog(option, "reminder"),
              ),
              _buildDynamicContainer("Reminder", selectedReminder),
              _buildSectionTitle("Colors"),
              _buildColorOptions([
                const Color(0xffFC95D3),
                const Color(0xffC5DAFE),
                const Color(0xffE6F16C),
                const Color(0xff7AE3B7),
                const Color(0xffE28EE3),
              ]),
              _buildColorContainer(selectedColor),
              SizedBox(
                height: height * 0.02,
              ),
              _buildFinalContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildOptions(List<String> options, void Function(String) onTap) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 2.5,
        children: options.map((option) {
          return GestureDetector(
            onTap: () => onTap(option),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffD5CA63),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  option,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildColorOptions(List<Color> colors) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: colors.map((color) {
          return GestureDetector(
            onTap: () => _showConfirmationDialogForColor(color),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showConfirmationDialog(String option, String section) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Are you sure about that change?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text("You selected \"$option\" in \"$section\"."),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () {
                setState(() {
                  if (section == "about") {
                    selectedAbout = option;
                  } else if (section == "reminder") {
                    selectedReminder = option;
                  }
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialogForColor(Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Are you sure about that color?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () {
                setState(() {
                  selectedColor = color;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDynamicContainer(String section, String selection) {
    if (selection.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4, 4),
              blurRadius: 4.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          "Selected: $selection",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildColorContainer(Color? color) {
    if (color == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4, 4),
              blurRadius: 4.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinalContainer() {
    bool isAllSelected = selectedAbout.isNotEmpty &&
        selectedReminder.isNotEmpty &&
        selectedColor != null;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.06,
      decoration: const BoxDecoration(color: Color(0xffC4B319), boxShadow: [
        BoxShadow(
          offset: Offset(4, 4),
          blurRadius: 4.0,
        ),
      ]),
      child: GestureDetector(
        onTap: isAllSelected
            ? () {
                _onDone();
              }
            : () {
                showFinalConfirmation();
              },
        child: const Center(
          child: Text(
            "Done",
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void showFinalConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.amber[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Text(
            "You haven't selected all options yet. \n Select them to continue.",
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

  void _onDone() {
    Navigator.pop(context, {
      'about': selectedAbout,
      'reminder': selectedReminder,
      'color': selectedColor ?? Colors.transparent,
    });
  }
}
