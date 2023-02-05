import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanagama_app/components/detailText.dart';

import '../constant.dart';
import '../models/form.dart';

class DetailedForm extends StatelessWidget {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final Forms form;

  DetailedForm(this.form);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.8,
                      width: width * 0.92,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                'Formulir Reservasi',
                                style: TextStyle(
                                    fontFamily: 'Bellota',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.3,
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                  color: Constants.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${form.tujuan}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("${form.tangalMulai}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text("${form.waktuMulai}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${form.tanggalAkhir}",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text("${form.waktuAkhir}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.people),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("${form.jumlahRombongan}"),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            height: 40,
                                            child: Center(
                                                child: Text("${form.status}"))),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Details Information',
                                    style: TextStyle(
                                        fontFamily: "Bellota",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                            DetailText(
                                field: 'Nama Lengkap',
                                value: '${form.namaLengkap}'),
                            DetailText(
                                field: 'Alamat Email', value: '${form.email}'),
                            DetailText(
                                field: 'Nomor Telepon',
                                value: '${form.nomorHandphone}'),
                            DetailText(
                                field: 'Instansi',
                                value: '${form.namaInstansi}'),
                            DetailText(
                                field: 'Status Survey',
                                value: '${form.survey}'),
                                SizedBox(height: 50,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Fluttertoast.showToast(
                                            msg: 'form dihapus');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: 60,
                                        child: Center(
                                            child: Text(
                                          'Hapus',
                                          style: TextStyle(
                                              fontFamily: "Bellota",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        tapKirim();
                                      },
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 19, 85, 68),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Kirim',
                                          style: TextStyle(
                                              fontFamily: "Bellota",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void tapKirim() async{
    final String newStatus = 'Proses';
    form.status= newStatus;
    await FirebaseFirestore.instance.collection('users').doc(uid).collection('form').doc(form.id).update({
      'status' :"Diproses",
    });

    //Navigator.of(context).pop();
    
  } 
}
