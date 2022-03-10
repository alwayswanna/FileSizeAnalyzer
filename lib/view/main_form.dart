import 'dart:collection';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:disk_space_analyzer/view/result_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class _MainFormState extends State<MainForm> {
  Map<String, double> fileMap = new HashMap();
  List<Color> _list = List<Color>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("~ Folder analyzer ~"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select folder for analyze:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: analyze,
        tooltip: 'Select',
        child: Icon(Icons.attach_file),
      ),
    );
  }

  void analyze() async {
    String? selectedDir = await FilePicker.platform.getDirectoryPath();
    var dir = Directory(selectedDir!);
    final List<FileSystemEntity> entities = await dir.list().toList();
    entities.forEach((element) {
      _list.add(Color(Random().nextInt(0xffffffff)));
      File file = new File(element.path);
      var fileStat = file.stat();
      var path = splitPath(file.path);
      fileStat
          .then((value) => {fileMap[path] = (value.size / 1000).toDouble()});
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ResultForm(fileMap, _list)));
  }

  String splitPath(String path) {
    return path.split(Platform.pathSeparator).last;
  }
}

class MainForm extends StatefulWidget {
  createState() => _MainFormState();
}
