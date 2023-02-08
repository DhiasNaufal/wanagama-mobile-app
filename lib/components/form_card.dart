import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanagama_app/pages/detail_page.dart';

import '../constant.dart';
import '../models/form.dart';

class FormCard extends StatelessWidget {
  final Forms _form;

  FormCard(this._form);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => DetailedForm(_form))));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Image.asset(
                        'lib/assets/images/wanagama_hor.png',
                        scale: 13,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                      decoration: BoxDecoration(
                          color: "${_form.status}" == "Ditolak"
                              ? Colors.red
                              : "${_form.status}" == "Diterima"
                                  ? Colors.green
                                  : "${_form.status}" == "Diproses"
                                      ? Colors.orange
                                      : Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "${_form.status}",
                          style: TextStyle(
                              fontFamily: 'Bellota',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '${_form.tujuan}',
                    style: TextStyle(
                      fontSize: 19
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      Text(
                        '${_form.namaLengkap}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${_form.waktuMulai}",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("${_form.tangalMulai}",
                              style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${_form.waktuAkhir}",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("${_form.tanggalAkhir}",
                              style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
