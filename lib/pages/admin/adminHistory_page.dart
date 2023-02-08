import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/form_card.dart';
import '../../models/form.dart';

class AdminHistoryPage extends StatefulWidget {
  const AdminHistoryPage({super.key});

  @override
  State<AdminHistoryPage> createState() => _AdminHistoryPageState();
}

class _AdminHistoryPageState extends State<AdminHistoryPage> {
  List<Object>historyList =[];
  Future getFormList()async {
    var data = await FirebaseFirestore
    .instance
    .collectionGroup('form').where('status', isNotEqualTo: 'Diproses')
    .where('status', whereIn: ["Diterima","Ditolak"])
    .get();

    setState((){
      historyList = List.from(data.docs.map((doc) => Forms.fromSnapshot(doc)));

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
          itemCount: historyList.length,
          itemBuilder: (context, index) {
            return FormCard(historyList[index]as Forms);
          },),
      ),
    );
  }
}