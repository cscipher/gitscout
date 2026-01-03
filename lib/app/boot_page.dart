import 'package:flutter/material.dart';
import 'package:git_scout/app/app.dart';

class BootPage extends StatelessWidget {
  const BootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Git Scout", home: GitScoutApp());
  }
}
