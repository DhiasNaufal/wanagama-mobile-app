// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:wanagama_app/components/my_button.dart';
import 'package:wanagama_app/components/my_textfield.dart';

import '../models/form.dart';

class MyFormPage extends StatefulWidget {

  const MyFormPage({super.key,});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  Forms _form = Forms();

  final uid = FirebaseAuth.instance.currentUser?.uid;
  final user = FirebaseAuth.instance.currentUser!;
  var itemsTujuan = [
    'Penelitian',
    'Penginapan',
    'Camping',
    'Shooting',
    'Seminar',
    'Pelatihan',
    'Pendidikan Lingkungan',
    'Video/Foto Komersil',
    'Tour',
    'Gowes',
    'Event',
    ];
  var itemsSurvey = [
    'Sudah',
    'Belum',
    ];
  String selectedTujuan= 'Penginapan';
  String selectedSurvey= 'Sudah';
  // Controller
  final namaLengkapController = TextEditingController();
  final emailController = TextEditingController();
  final nomorHandphoneController = TextEditingController();
  final tujuanController = SingleValueDropDownController();
  final instansiController = TextEditingController();
  final fromdateinput = TextEditingController();
  final todateinput = TextEditingController();
  final fromtimeinput = TextEditingController();
  final totimeinput = TextEditingController();
  final surveyController = TextEditingController();
  final jumlahController = TextEditingController();
  final String status = 'Draft';

  // ===================
  

  @override
  void dispose(){
   namaLengkapController.dispose();
   emailController.dispose();
   nomorHandphoneController.dispose();
   tujuanController.dispose();
   instansiController.dispose();
   fromdateinput.dispose();
   todateinput.dispose();
   fromtimeinput.dispose();
   totimeinput.dispose();
   surveyController.dispose();
   jumlahController.dispose();
  }

  void simpanTap()async{
    if(_formKey.currentState!.validate()){
    _form.namaLengkap = namaLengkapController.text;
    _form.email = emailController.text.trim();
    _form.nomorHandphone= int.parse(nomorHandphoneController.text.trim());
    _form.tujuan= selectedTujuan;
    _form.namaInstansi= instansiController.text.trim(); 
    _form.tangalMulai= fromdateinput.text.trim();
    _form.tanggalAkhir= todateinput.text.trim();
    _form.waktuMulai= fromtimeinput.text.trim();
    _form.waktuAkhir= totimeinput.text.trim();
    _form.survey= selectedSurvey;
    _form.jumlahRombongan= int.parse(jumlahController.text.trim());
    _form.status = status;
    _form.id = DateTime.now().millisecondsSinceEpoch.toString();
    _form.uid = uid;
      

    await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .collection('form')
    .doc(_form.id)
    .set(_form.toJson());
    Fluttertoast.showToast(msg: 'Form Tersimpan');
    Navigator.pop(context);
    }
    Fluttertoast.showToast(msg: 'Form Belum Lengkap');

  }
final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
  fromdateinput.text = ""; //set the initial value of text field
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),

      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Formulir Reservasi',
                      style: TextStyle(
                        fontFamily: 'Bellota', 
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                        ),
                      ),
                  ),
                  
                  SizedBox(height: 20,),
                  Text(
                    'Nama Lengkap',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: namaLengkapController,
                    decoration: new InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "contoh: nasrullah fidunya hasanah",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.person_rounded,color: Color.fromARGB(255, 19, 85, 68),),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                          
                          ),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                            ),                          
                          ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },                      
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Alamat email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "contoh: nasrullah@gmail.com",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.mail, color:Color.fromARGB(255, 19, 85, 68),),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                            ),                        
                          ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },

                    ),
                  SizedBox(height: 10,),
                  Text(
                    'Nomor Telepon',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: nomorHandphoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "contoh: 08xxxxx",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.call, color:Color.fromARGB(255, 19, 85, 68),),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                            ),
                          ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Nomor telepon tidak boleh kosong';
                      }
                      return null;
                    },                         
                    ),
                    SizedBox(height: 10,),
                  Text(
                    'Tujuan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  Container(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.directions,color:Color.fromARGB(255, 19, 85, 68),),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color:  Color.fromARGB(255, 130, 130, 130))
                          ),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                            ),
                      ),                        
                      value: selectedTujuan,

                      items: itemsTujuan.map((String itemsTujuan) {
                        return DropdownMenuItem(
                          value: itemsTujuan,
                          child: Text(itemsTujuan),
                        );
                      }).toList(),
                      onChanged: (String? newValue) { 
                        setState(() {
                          selectedTujuan = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Dari:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextFormField(                      
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(

                          icon: Icon(Icons.date_range,color:Color.fromARGB(255, 19, 85, 68),),
                          hintText: 'pilih...',
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 130, 130, 130)),
                          ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                          ),
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                        ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Tanggal kosong!';
                      }
                      return null;
                    },                        
                          controller: fromdateinput,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000), 
                              lastDate:DateTime(2101)
                              );
                            if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('MMM d, yyy').format(pickedDate); 
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement
                      
                                setState(() {
                                   fromdateinput.text = formattedDate; //set output date to TextField value. 
                                });
                            }else{
                                print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 15,),
          
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            icon: Icon(Icons.access_time,color:Color.fromARGB(255, 19, 85, 68),),
                          hintText: 'pilih...',
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 130, 130, 130)),
                          ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                          ),
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                        ),
                          controller: fromtimeinput,
                          onTap: () async {
                            TimeOfDay? pickedTime= await showTimePicker(
                              context: context, 
                              initialTime: TimeOfDay.now(),
                              );
                            if(pickedTime!= null ){
                                print(pickedTime.format(context));  //pickedDate output format => 2021-03-10 00:00:00.000 
                            setState(() {
                              fromtimeinput.text = pickedTime.format(context); //set output date to TextField value. 
                            });
                            }else{
                                print("Date is not selected");
                            }
                          },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Waktu kosong!';
                      }
                      return null;
                    },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),   
                  Text(
                    'Hingga',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            hintText: 'pilih...',
                            icon: Icon(Icons.date_range,color:Color.fromARGB(255, 19, 85, 68),),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 130, 130, 130)),
                          ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                          ),
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                        ),
                          controller: todateinput,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000), 
                              lastDate:DateTime(2101)
                              );
                            if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('MMM d, yyy').format(pickedDate); 
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement
                      
                                setState(() {
                                   todateinput.text = formattedDate; //set output date to TextField value. 
                                });
                            }else{
                                print("Date is not selected");
                            }
                          },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Tanggal kosong!';
                      }
                      return null;
                    },                        
                        ),
                      ),
                      SizedBox(width: 15,),
          
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            hintText: "pilih...",
                            icon: Icon(Icons.access_time,color:Color.fromARGB(255, 19, 85, 68),),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Color.fromARGB(255, 130, 130, 130)),
                          ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                          ),
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                        ),
                          controller: totimeinput,
                          onTap: () async {
                            TimeOfDay? pickedTime= await showTimePicker(
                              context: context, 
                              initialTime: TimeOfDay.now(),
                              );
                            if(pickedTime!= null ){
                                print(pickedTime.format(context));  //pickedDate output format => 2021-03-10 00:00:00.000 
                            setState(() {
                              totimeinput.text = pickedTime.format(context); //set output date to TextField value. 
                            });
                            }else{
                                print("Date is not selected");
                            }
                          },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Waktu kosong!';
                      }
                      return null;
                    },                          
                        ),
                      ),                   
                    ],
                  ),                  
                  SizedBox(height: 10,),
                  Text(
                    'Nama Instansi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: instansiController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      hintText: "contoh: Universitas Siliwangi",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.location_city_rounded,color:Color.fromARGB(255, 19, 85, 68),),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                            ),
                          ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Instansi tidak boleh kosong';
                      }
                      return null;
                    },                          
                    ),
                  SizedBox(height: 10,),
                  Text(
                    'Apakah sudah Survey?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  Container(
                    
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.question_mark,color:Color.fromARGB(255, 19, 85, 68),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color:  Color.fromARGB(255, 130, 130, 130))
                          ),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                            ),
                      ),                        
                      value: selectedSurvey,

                      items: itemsSurvey.map((String itemsSurvey) {
                        return DropdownMenuItem(
                          value: itemsSurvey,
                          child: Text(itemsSurvey),
                        );
                      }).toList(),
                      onChanged: (String? newValue) { 
                        setState(() {
                          selectedSurvey = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Jumlah Pengunjuang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                     )
                    ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      hintText: "contoh: 34",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.people, color:Color.fromARGB(255, 19, 85, 68),),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                            ),
                          ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Jumlah rombongan tidak boleh kosong';
                      }
                      return null;
                    },                          
                    ),
                    SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 25,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Fluttertoast.showToast(msg: 'form dihapus');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 60,
                        
                            child: Center(
                              child:Icon(
                                Icons.delete_rounded,
                                color: Colors.white,),),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        flex: 75,
                        child: GestureDetector(
                          onTap: (){
                            simpanTap();
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color:  Color.fromARGB(255, 19, 85, 68),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('Simpan', style: TextStyle(
                                fontFamily: "Bellota",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          )),
      ),
    );
  }
}
