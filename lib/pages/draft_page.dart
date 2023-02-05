import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import '../components/form_card.dart';
import '../models/form.dart';

class DraftPage extends StatefulWidget {

  @override
  State<DraftPage> createState() =>  _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  List<Object>draftList =[];
  Future getFormList()async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    var data = await FirebaseFirestore
    .instance
    .collection('users')
    .doc(uid)
    .collection('form')
    .where('status', isEqualTo: false)
    .get();

    setState((){
      draftList = List.from(data.docs.map((doc) => Forms.fromSnapshot(doc)));

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
      body: RefreshIndicator(
        onRefresh: getFormList,
        child: ListView.builder(
          itemCount:draftList.length,
          itemBuilder: (context, index) {
            return FormCard(draftList[index]as Forms);
          },),
      ),
    );
  }
}