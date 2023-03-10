import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanagama_app/components/form_card.dart';
import 'package:wanagama_app/models/form.dart';

import '../constant.dart';

class StatusPage extends StatefulWidget {
  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<Object>statusList =[];

  Future getFormList()async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    var data = await FirebaseFirestore
    .instance
    .collection('users')
    .doc(uid)
    .collection('form')
    .where('status', isNotEqualTo: 'Draft')
    .get();

    setState((){
      statusList = List.from(data.docs.map((doc) => Forms.fromSnapshot(doc)));

    });
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    getFormList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.neutralColor,
      body: ListView.builder(
        itemCount: statusList.length,
        itemBuilder: (context, index) {
          return FormCard(statusList[index]as Forms);
        },),
    );
  }
}