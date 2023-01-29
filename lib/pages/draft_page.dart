import "package:flutter/material.dart";

class DraftPage extends StatefulWidget {
  const DraftPage({super.key});

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Draft Page')
      ],
    );
  }
}