import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanagama_app/components/detailText.dart';
import 'package:wanagama_app/pages/auth_page.dart';
import 'package:wanagama_app/pages/draft_page.dart';
import 'package:wanagama_app/pages/home_page.dart';

import '../constant.dart';
import '../models/form.dart';

class DetailedForm extends StatefulWidget {
  final Forms form;

  DetailedForm(this.form);

  @override
  State<DetailedForm> createState() => _DetailedFormState();
}

class _DetailedFormState extends State<DetailedForm> {
  bool _isVisible = false;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.neutralColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(color: Constants.primaryColor),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Formulir Pemesanan',
                        style: GoogleFonts.bellota(
                            color: Colors.white,
                            fontSize: 29,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: "${widget.form.status}" == "Ditolak"
                              ? Colors.red
                              : "${widget.form.status}" == "Diterima"
                                  ? Colors.green
                                  : "${widget.form.status}" == "Diproses"
                                      ? Colors.orange
                                      : Colors.blueGrey,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "${widget.form.status}",
                        style: GoogleFonts.bellotaText(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'lib/assets/images/wanagama_hor.png',
                              scale: 12,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Constants.primaryColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${widget.form.jumlahRombongan}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                '${widget.form.tujuan}',
                                style: GoogleFonts.poppins(fontSize: 19),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${widget.form.waktuMulai}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text("${widget.form.tangalMulai}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${widget.form.waktuAkhir}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("${widget.form.tanggalAkhir}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                      //Judul Tujuan
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Detail Pemesan",
                        style: GoogleFonts.bellotaText(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 5),
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              Text('${widget.form.namaLengkap}'),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nomor Telepon'),
                                  Text('${widget.form.nomorHandphone}'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Alamat email'),
                                  Text(
                                    '${widget.form.email}',
                                    style: GoogleFonts.bellotaText(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama Instansi',
                                    style: GoogleFonts.bellotaText(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '${widget.form.namaInstansi}',
                                    style: GoogleFonts.bellotaText(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Status Survey',
                                      style: GoogleFonts.workSans()),
                                  Text(
                                    '${widget.form.survey}' +
                                        " melakukan Survey",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                '${widget.form.status}' == "Draft"
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 7),
                            ],
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: tapHapus,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 2),
                                      child: Center(
                                          child: Text(
                                        'Hapus',
                                        style: GoogleFonts.workSans(
                                            color: Constants.primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      )),
                                      height: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Constants.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Constants.primaryColor
                                              .withOpacity(0.4)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: tapKirim,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 2),
                                      child: Center(
                                          child: Text(
                                        "Kirim",
                                        style: GoogleFonts.workSans(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      )),
                                      height: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Constants.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Constants.primaryColor),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      )

                    //Terima Tolak
                    : '${widget.form.status}' == "Diproses" &&
                            uid != "E80hb9Qun4bUswTIyiUmfSmssbb2"
                        ? Container(
                            // Container sedang diproses
                            )
                        : '${widget.form.status}' == "Diproses" &&
                                uid == "E80hb9Qun4bUswTIyiUmfSmssbb2"
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 7),
                                    ],
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: tapTolak,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 2),
                                              child: Center(
                                                  child: Text(
                                                'Tolak',
                                                style: GoogleFonts.workSans(
                                                    color:
                                                        Constants.primaryColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Constants
                                                          .primaryColor),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Constants.primaryColor
                                                      .withOpacity(0.4)),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: tapTerima,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, left: 2),
                                              child: Center(
                                                  child: Text(
                                                "Terima",
                                                style: GoogleFonts.workSans(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Constants
                                                          .primaryColor),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      Constants.primaryColor),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              )
                            : '${widget.form.status}' == "Diterima" &&
                                    uid != "E80hb9Qun4bUswTIyiUmfSmssbb2"
                                ? Container(
                                    // Barcode
                                    )
                                : '${widget.form.status}' == "Ditolak" &&
                                        uid != "E80hb9Qun4bUswTIyiUmfSmssbb2"
                                    ? Container(
                                        // Status Penolakan
                                        )
                                    : Text("Done"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void tapKirim() async {
    final String newStatus = 'Proses';
    widget.form.status = newStatus;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('form')
        .doc(widget.form.id)
        .update({
      'status': "Diproses",
    });
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => AuthPage()));
    //Navigator.of(context).pop();
  }

  void tapHapus() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.form.uid)
        .collection('form')
        .doc(widget.form.id)
        .delete();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => AuthPage()));
  }

  void tapTerima() async {
    final String newStatus = 'Proses';
    widget.form.status = newStatus;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.form.uid)
        .collection('form')
        .doc(widget.form.id)
        .update({
      'status': "Diterima",
    });
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => AuthPage()));
    //Navigator.of(context).pop();
  }

  void tapTolak() async {
    final String newStatus = 'Proses';
    widget.form.status = newStatus;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.form.uid)
        .collection('form')
        .doc(widget.form.id)
        .update({
      'status': "Ditolak",
    });
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => AuthPage()));
    //Navigator.of(context).pop();
  }
}
