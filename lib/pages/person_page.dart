import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  File? _avatarImage; // Imaginea selectată din galerie

  // Funcție pentru selectarea imaginii
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _avatarImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
                      onTap: _pickImage, // Apăsarea avatarului deschide galeria
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: _avatarImage != null
                            ? FileImage(_avatarImage!)
                            : const AssetImage('images/profile.webp')
                                as ImageProvider,
                        child: _avatarImage == null
                            ? const Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Colors.black,
                              )
                            : null,
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

  // Widget pentru câmpuri editabile
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
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
