import 'package:flutter/material.dart';

class Forms{
    String? namaLengkap;
    String? email; 
    int? nomorHandphone;
    String? tujuan;
    String? namaInstansi;
    String? tangalMulai;
    String? waktuMulai;
    String? tanggalAkhir;
    String? waktuAkhir;
    String? survey;
    int? jumlahRombongan;
    bool? status;  

    Forms();
    Map<String, dynamic> toJson()=>{
      'nama lengkap':namaLengkap,
      'alamat email': email,
      'nomor handphone':nomorHandphone,
      'tujuan': tujuan,
      'nama instansi':namaInstansi,
      'tanggal mulai':tangalMulai,
      'waktu mulai': waktuMulai,      
      'tanggal akhir':tanggalAkhir,
      'waktu akhir':waktuAkhir,
      'survey':survey,
      'jumlah rombongan':jumlahRombongan,
      'status': status,     
    };

  Forms.fromSnapshot(snapshot)
    : namaLengkap = snapshot.data()['nama lengkap'],
      email = snapshot.data()['alaat email'],
      nomorHandphone = snapshot.data()['nomor handphone'],
      tujuan = snapshot.data()['tujuan'],
      namaInstansi = snapshot.data()['nama instansi'],
      tangalMulai = snapshot.data()['tanggal mulai'],
      waktuMulai= snapshot.data()['waktu mulai'],
      tanggalAkhir = snapshot.data()['tanggal akhir'],
      waktuAkhir= snapshot.data()['waktu akhir'],
      survey = snapshot.data()['survey'],
      jumlahRombongan = snapshot.data()['jumlah rombongan'],
      status = snapshot.data()['status'];



}