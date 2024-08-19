import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marksheet_scanner/home/checkers.dart';
import 'package:marksheet_scanner/output/output.dart';
import 'package:path_provider/path_provider.dart';

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
  String scanText = '';

  pickImageFromGallery(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _isLoading && _image == null
                    ? const CircularProgressIndicator()
                    : _image == null
                        ? const Text('No Image Selected!')
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.file(
                                _image!,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : ElevatedButton.icon(
                                      icon: const Icon(Icons.abc),
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          backgroundColor: Colors.green[500],
                                          foregroundColor: Colors.white),
                                      onPressed: () => readTextFromImage(),
                                      label: const Text('Extract Text'))
                            ],
                          ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          backgroundColor: Colors.red[500],
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        pickImageFromGallery(ImageSource.camera);
                      },
                      label: const Text(
                        'Using Camera',
                        maxLines: 2,
                      )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton.icon(
                      icon: const Icon(Icons.photo),
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          backgroundColor: Colors.blue[500],
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        pickImageFromGallery(ImageSource.gallery);
                      },
                      label: const Text(
                        'Pick From Gallery',
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> readTextFromImage() async {
    setState(() {
      _isLoading = true;
    });
    final inputImage = InputImage.fromFile(_image!);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    List<TextBlock> textBlocks = recognizedText.blocks;

    textBlocks.sort((a, b) {
      if (a.boundingBox.top != b.boundingBox.top) {
        return a.boundingBox.top.compareTo(b.boundingBox.top);
      } else {
        return a.boundingBox.left.compareTo(b.boundingBox.left);
      }
    });

    List<List<String>> csvData = [];
    List<String> subs = [];
    List<String> subCode = [];
    String date = '',
        grandTotal = '',
        result = '',
        examType = '',
        name = '',
        campus = '',
        roll = '',
        yearPart = '',
        level = '',
        program = '',
        crn = '';

    for (TextBlock block in textBlocks) {
      for (TextLine line in block.lines) {
        if (checkExamType(line.text)) {
          examType = line.text;
        }

        if (checkName(line.text)) {
          name = line.text;
        }

        if (checkCampus(line.text)) {
          campus = line.text;
        }

        if (checkRoll(line.text)) {
          roll = line.text;
        }

        if (checkPart(line.text)) {
          yearPart = line.text;
        }

        if (checkLevel(line.text)) {
          if (line.text.contains(':-')) {
            level = line.text.split(':-').last;
          } else {
            level = line.text;
          }
        }

        if (checkProgram(line.text)) {
          if (line.text.contains(':-')) {
            program = line.text.split(':-').last;
          } else {
            program = line.text;
          }
        }

        if (checkSubjectCode(line.text)) {
          subCode.add(line.text);
        }

        if (checkSubjects(line.text)) {
          subs.add(line.text);
        }

        if (checkCRN(line.text)) {
          crn = line.text;
        }
        if (checkDate(line.text)) {
          date = line.text.split(':-')[1];
        }

        if (checkGrandTotal(line.text)) {
          grandTotal = line.text.split('Total ')[1];
        }
        if (checkResult(line.text)) {
          result = line.text.split('Result ')[1];
        }

        List<String> row = line.text.split('\n');
        csvData.add(row);
      }
    }

    await _saveToCSV(csvData);

    List<String> combinedSub = [];

    for (int i = 0; (i < subs.length && i < subCode.length); i++) {
      combinedSub.add('${subCode[i]} ${subs[i]}');
    }

    setState(() {
      _isLoading = false;
    });
    textRecognizer.close();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Output(
                name: name,
                roll: roll,
                crn: crn,
                campus: campus,
                yearPart: yearPart,
                examType: examType,
                level: level,
                program: program,
                subjects: combinedSub,
                date: date,
                grandTotal: grandTotal,
                result: result)));
  }

  Future<void> _saveToCSV(List<List<String>> csvData) async {
    final String csv = const ListToCsvConverter().convert(csvData);
    Directory? directory = Directory('/storage/emulated/0/Download');
    if (!(await directory.exists())) {
      directory = await getExternalStorageDirectory(); // Fallback
    }
    final path = "${directory!.path}/scanned_marksheet.csv";
    final File file = File(path);

    await file.writeAsString(csv);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Data saved to scanned_marksheet.csv"),
    ));
  }
}
