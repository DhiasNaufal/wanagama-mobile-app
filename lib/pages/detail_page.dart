import 'package:barcode_widget/barcode_widget.dart';
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
                        style: GoogleFonts.bellotaText(
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
                        style: GoogleFonts.bellota(fontSize: 17),
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
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Text(
                                '${widget.form.tujuan}',
                                style: TextStyle(fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${widget.form.waktuMulai}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${widget.form.tangalMulai}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${widget.form.waktuAkhir}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${widget.form.tanggalAkhir}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
                            fontSize: 18, fontWeight: FontWeight.w600),
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
                              Text(
                                '${widget.form.namaLengkap}',
                                style: TextStyle(fontSize: 18),
                              ),
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
                                  Text(
                                    'Nomor Telepon',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    '${widget.form.nomorHandphone}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Alamat email',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    '${widget.form.email}',
                                    style: TextStyle(fontSize: 16),
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
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    '${widget.form.namaInstansi}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Status Survey',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    '${widget.form.survey}',
                                    style: TextStyle(fontSize: 16),
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
                //==================== User Mengirim Atau Menghapus =========================
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

                    //==================== User Menunggu  Diproses =========================
                    : '${widget.form.status}' == "Diproses" &&
                            uid != "E80hb9Qun4bUswTIyiUmfSmssbb2"
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            // Container sedang diproses
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
                            child: Row(children: [
                              Image.asset(
                                  'lib/assets/images/kakek_wanagama.png'),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Formulir anda sedang Diproses",
                                    style: GoogleFonts.bellota(fontSize: 20),
                                  ),
                                  Text("...")
                                ],
                              )
                            ]),
                          )
                        //==================== Admin Menerima Atau Menolak =========================
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
                            //==================== User Menerima Tiket yang disetujui =========================
                            : '${widget.form.status}' == "Diterima" &&
                                    uid != "E80hb9Qun4bUswTIyiUmfSmssbb2"
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 7),
                                        ],
                                      ),
                                      // Barcode
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 20),
                                        child: BarcodeWidget(
                                          barcode: Barcode.code128(),
                                          data: '${widget.form.id}',
                                        ),
                                      ),
                                    ),
                                  )
                                //==================== User Menerima Tiket yang ditolak =========================
                                : '${widget.form.status}' == "Ditolak" &&
                                        uid != "E80hb9Qun4bUswTIyiUmfSmssbb2"
                                    ? Container(
                                        //padding: EdgeInsets.symmetric(horizontal: 100),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 7),
                                          ],
                                        ),
                                        // Status Penolakan
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    flex: 20,
                                                    child: Icon(Icons.warning)),
                                                Expanded(
                                                    flex: 70,
                                                    child: Text(
                                                        'Mohon maaf, formulir anda ditolak')),
                                                Expanded(
                                                  flex: 10,
                                                  child: Image.asset(
                                                    'lib/assets/images/siGama.png',
                                                    scale: 8,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ))
                                    : Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 7),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 120,
                                                    vertical: 20),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Constants
                                                            .primaryColor),
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.green),
                                                child: Text("Done",
                                                style: GoogleFonts.bellota(
                                                  fontSize: 20,
                                                  color: Constants.primaryColor,
                                                  fontWeight: FontWeight.bold
                                                ),
                                                )),
                                          ],
                                        )),
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
