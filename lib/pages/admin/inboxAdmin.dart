import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/form_card.dart';
import '../../models/form.dart';

class InboxAdmin extends StatefulWidget {
  const InboxAdmin({super.key});

  @override
  State<InboxAdmin> createState() => _InboxAdminState();
}

class _InboxAdminState extends State<InboxAdmin> {
  List<Object>inboxList =[];

  Future getFormList()async {
    var data = await FirebaseFirestore
    .instance
    .collectionGroup('form').where('status', isEqualTo: 'Diproses')
    .get();

    setState((){
      inboxList = List.from(data.docs.map((doc) => Forms.fromSnapshot(doc)));

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
          itemCount: inboxList.length,
          itemBuilder: (context, index) {
            return FormCard(inboxList[index]as Forms);
          },),
      ),
    );
  }
}