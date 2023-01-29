import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'Draft Form',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
                      
          ],

        )),
    );
  }
}