import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFBD288),
        title: const Text("Profile"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: const Color(0xffFBD288),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Secțiunea de antet cu avatar editabil
              Container(
                width: size.width,
                height: size.height * 0.35,
                color: const Color(0xffFCF596),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(100), // Colțuri rotunjite
                        child: Container(
                          width: MediaQuery.of(context).size.height *
                              0.15, // Lățimea imaginii
                          height: MediaQuery.of(context).size.height *
                              0.15, // Înălțimea imaginii
                          color: Colors.grey
                              .shade200, // Fundal implicit dacă imaginea lipsește
                          child: _image == null
                              ? Image.asset(
                                  'images/profile.webp',
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Edit Your Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Alte secțiuni (câmpuri editabile și buton de salvare)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'Full Name',
                      hint: 'Enter your full name',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Email',
                      hint: 'Enter your email',
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Bio',
                      hint: 'Write something about yourself',
                      icon: Icons.edit,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),

              // Buton pentru salvare
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Profile Saved');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFCF596),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Save Profile',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle:
            TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
        prefixIcon: Icon(icon, color: Colors.orange[700]),
        filled: true,
        fillColor: const Color(0xFFFCF596), // Soft yellow background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.orange[700]!, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.orange[700]!, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
      style: const TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
