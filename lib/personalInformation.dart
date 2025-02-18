import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PersonalInformationScreen extends StatefulWidget {
  @override
  _PersonalInformationScreenState createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  Map<String, String> userInfo = {
    'Employee ID': '1010',
    'Email': 'shagunpandey303@gmail.com',
    'Phone': '88659166988',
    'Date of Birth': 'Feb 28, 2003',
    'Address': '123, Street, City',
    'Department': 'IT',
    'Joining Date': 'Feb 10, 2020',
  };

  File? _profileImage; // Store the selected image

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _editInfo(String key) {
    TextEditingController controller = TextEditingController(text: userInfo[key]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $key'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: _getIconForField(key),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                userInfo[key] = controller.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Icon _getIconForField(String key) {
    switch (key) {
      case 'Employee ID':
        return Icon(Icons.badge, color: Colors.redAccent);
      case 'Email':
        return Icon(Icons.email, color: Colors.redAccent);
      case 'Phone':
        return Icon(Icons.phone, color: Colors.redAccent);
      case 'Date of Birth':
        return Icon(Icons.cake, color: Colors.redAccent);
      case 'Address':
        return Icon(Icons.home, color: Colors.redAccent);
      case 'Department':
        return Icon(Icons.group, color: Colors.redAccent);
      case 'Joining Date':
        return Icon(Icons.business, color: Colors.redAccent);
      default:
        return Icon(Icons.info, color: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!) // Show selected image
                          : AssetImage('assets/pandey.jpg') as ImageProvider,
                    ),
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera_alt, color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Shagun Pandey',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ...userInfo.entries.map((entry) => _buildInfoTile(entry.key, entry.value)).toList(),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Card(
      child: ListTile(
        leading: _getIconForField(title),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing: Icon(Icons.edit, color: Colors.grey),
        onTap: () => _editInfo(title),
      ),
    );
  }
}