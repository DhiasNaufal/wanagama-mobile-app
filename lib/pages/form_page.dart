import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wanagama_app/components/my_button.dart';
import 'package:wanagama_app/components/my_textfield.dart';

class MyFormPage extends StatefulWidget {

  MyFormPage({super.key,});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
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
  // ===================

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
      
              MyTextField(
              controller: emailController, 
              hintText: 'NasiGoreng@gmail.com', 
              obscureText: false, 
              fieldIcon: Icons.email),
              
              SizedBox(height: 10,),
      
              MyTextField(
              controller: namaLengkapController, 
              hintText: 'Nasi goreng Cipedes', 
              obscureText: false, 
              fieldIcon: Icons.person),
              
              SizedBox(height: 10,),
      
              MyTextField(
              controller: nomorHandphoneController, 
              hintText: '08xxxxxxxx', 
              obscureText: false, 
              fieldIcon: Icons.call),
      
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DropDownTextField(
                  controller: tujuanController,
                  textFieldDecoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color.fromARGB(255, 130, 130, 130)),
                    ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                   ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                 filled: true,
                hintText: 'Tujuan',
                icon: Icon(Icons.task),
                ),
                  dropDownList: const[
                    DropDownValueModel(name: 'Penginapan', value: "penginapan"),
                    DropDownValueModel(name: 'Camping', value: "Camping"),
                    DropDownValueModel(name: 'Shooting', value: "Shooting"),
                    DropDownValueModel(name: 'Seminar', value: "Seminar"),
                    DropDownValueModel(name: 'Pelatihan', value: "pelatihan"),
                    DropDownValueModel(name: 'Pendidikan Lingkungan', value: "Pendidikan Lingkungan"),
                    DropDownValueModel(name: 'Video/Foto Komersil', value: "Video/Foto Komersil"),
                    DropDownValueModel(name: 'Tour', value: "Tour"),
                    DropDownValueModel(name: 'Gowes', value: "Gowes"),
                    DropDownValueModel(name: 'Event', value: "Event"),
                    DropDownValueModel(name: 'Lainnya...', value: "Lainnya..."),
                  ],
                  ),

              ),
              SizedBox(height: 10,),
              MyTextField(
              controller: instansiController, 
              hintText: 'Univeritas Siliwangi', 
              obscureText: false, 
              fieldIcon: Icons.house),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                        icon: Icon(Icons.date_range),
                        hintText: 'Tanggal Mulai',
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color.fromARGB(255, 130, 130, 130)),
                        ),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 19, 85, 68))
                        ),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                      ),
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
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.access_time),
                        hintText: 'waktu',
                        enabledBorder: OutlineInputBorder(
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),   
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tanggal Berakhir',
                          icon: Icon(Icons.date_range),
                        enabledBorder: OutlineInputBorder(
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
                      ),
                    ),
                    SizedBox(width: 15,),

                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "waktu",
                          icon: Icon(Icons.access_time),
                        enabledBorder: OutlineInputBorder(
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
                      ),
                    ),                   
                  ],
                ),
              ),
              SizedBox(height: 10,),
              MyTextField(
              controller: surveyController, 
              hintText: 'Apakah Sudah Survey?', 
              obscureText: false, 
              fieldIcon: Icons.question_mark),
              SizedBox(height: 10,),                     
              MyTextField(
              controller: jumlahController, 
              hintText: '28', 
              obscureText: false, 
              fieldIcon: Icons.people),
              SizedBox(height: 10,),  
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex:3 ,
                    child: MyButton(
                      onTap: (){
                  
                      }, textButton: 's'),
                  ),

                  Expanded(
                    flex:7,
                    child: MyButton(
                      onTap: (){},
                       textButton: 'Simpan'),
                  ),
                ],
              )                   
            ],
          )),
      ),
    );
  }
}
