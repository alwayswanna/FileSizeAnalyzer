import 'package:disk_space_analyzer/view/main_form.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Analyzer());
}

class Analyzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "~ Folder analyzer ~",
      initialRoute: '',
      routes: {
        '': (context) => MainForm(),
      },
    );
  }
}
