import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanagama_app/pages/detail_page.dart';

import '../constant.dart';
import '../models/form.dart';

class DetailCard extends StatelessWidget {
  final Forms _form;
  

  DetailCard(this._form);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailedForm(_form))));
      },
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Constants.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person,
                        color: Colors.white,),
                        Text(
                          "${_form.namaLengkap}",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white
                          )
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: "${_form.status}"=="Ditolak"?Colors.red
                        :"${_form.status}"=="Diterima"?Colors.green
                        :"${_form.status}"=="Diproses"?Colors.orange
                        :Colors.white
                        ,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "${_form.status}",
                          style: TextStyle(
                            fontFamily: 'Bellota',
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
                    )
    
                  ],
                ),
                SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${_form.tujuan}"),
                          Text("${_form.tangalMulai} - ${_form.tanggalAkhir}")
                        ]),
                    ) ,
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}