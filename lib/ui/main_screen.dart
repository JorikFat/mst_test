import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const MainScreen());

  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("main"), centerTitle: true),
      body: Center(child: Text("Main Screen")),
    );
  }
}
