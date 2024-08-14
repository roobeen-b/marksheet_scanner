import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  File? _image;
  final imagePicker = ImagePicker();

  Future pickImageFromGallery() async {
    setState(() {
      _isLoading = true;
    });
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {});
      _image = File(pickedImage.path);
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _image == null
                ? const Text('No Image Selected!')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.file(
                        _image!,
                        height: MediaQuery.of(context).size.height * 0.5,
                      ),
                    ],
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImageFromGallery,
        tooltip: 'Pick an Image',
        child: const Icon(Icons.drive_folder_upload),
      ),
    );
  }
}
