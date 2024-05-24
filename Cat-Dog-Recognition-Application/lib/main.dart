import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:html/parser.dart' as html_parser;

void main() {
  runApp(PetClassifierApp());
}

class PetClassifierApp extends StatelessWidget {
  const PetClassifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: PetClassifierHomePage(),
    );
  }
}

class PetClassifierHomePage extends StatefulWidget {
  const PetClassifierHomePage({super.key});

  @override
  _PetClassifierHomePageState createState() => _PetClassifierHomePageState();
}

class _PetClassifierHomePageState extends State<PetClassifierHomePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;
  File? _imageFile;
  String _classificationResult = "";

  Future<void> _selectImage() async {
    try {
      _pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (_pickedImage != null) {
        setState(() {
          _imageFile = File(_pickedImage!.path);
        });
        await _uploadAndClassifyImage(_imageFile!);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error selecting image: $e');
      }
    }
  }

  Future<void> _uploadAndClassifyImage(File image) async {
    final uri = Uri.parse(
      'https://cat-dog-classifier-using-flask-xisi3zlsna-el.a.run.app/upload',
    );

    var request = http.MultipartRequest('POST', uri);
    String mimeType = lookupMimeType(image.path) ?? 'application/octet-stream';
    var mimeTypeData = mimeType.split('/');

    request.files.add(await http.MultipartFile.fromPath(
      'photo',
      image.path,
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
    ));

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      setState(() {
        _classificationResult = responseBody;
      });
    } else {
      setState(() {
        _classificationResult = 'Failed to upload image';
      });
    }
  }

  Future<void> _getPrediction(String endpoint) async {
    final uri = Uri.parse(endpoint);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        _classificationResult = response.body;
      });
    } else {
      setState(() {
        _classificationResult = 'Failed to retrieve prediction';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView( // Make the whole layout scrollable
        child: Column(
          children: [
            AppBar(
              title: Text('Cat or Dog Classifier', style: TextStyle(fontFamily: 'Courier')),
              backgroundColor: const Color.fromARGB(255, 67, 70, 73),
              foregroundColor: Colors.white,
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: _selectImage,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), // Make button round
                  minimumSize: Size(200, 200), // Set minimum size for the button
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: Colors.black, // Ensure text is visible on white button
                ),
                child: Text('Select Image', style: TextStyle(fontFamily: 'Courier')),
              ),
            ),
            if (_pickedImage != null)
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.file(
                  File(_pickedImage!.path),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              )
            else
              SizedBox(
                height: 240,
                child: Center(
                  child: Text(
                    'No image selected',
                    style: TextStyle(fontSize: 16, fontFamily: 'Courier', color: Colors.white),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(80),
              child: Text(
                html_parser.parse(_classificationResult).body?.text ?? '',
                style: TextStyle(fontFamily: 'Courier', fontSize: 18, color: Colors.white), // Updated text style
              ),
            ),
          ],
        ),
      ),
    );
  }
}
