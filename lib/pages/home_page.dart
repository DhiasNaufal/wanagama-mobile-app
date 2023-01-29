import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:wanagama_app/pages/draft_page.dart';
import 'package:wanagama_app/pages/form_page.dart';
import 'package:wanagama_app/pages/dashboard_page.dart';
import 'package:wanagama_app/pages/profile_page.dart';
import 'package:wanagama_app/pages/status_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int currentTab = 0;
  final List<Widget> screens = [
    DashboardPage(),
    ProfilePage(),
    DraftPage(),
    StatusPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DraftPage();
  
  void SignUserOut (){
    FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen),
      backgroundColor: Colors.white,  
      appBar: AppBar(
        actions: [
          IconButton(onPressed: SignUserOut, icon: Icon(Icons.logout))
        ],
        title: const Text(
          'Wanagama Mobile App',
          style: TextStyle(
            fontFamily: 'Bellota',
            fontWeight: FontWeight.bold
          ),
          ),
        backgroundColor:Color.fromARGB(255, 19, 85, 68), 
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 19, 85, 68),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = DashboardPage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab==0?Color.fromARGB(243, 243, 209, 16):Colors.white,
                            ),
                          Text("Home",
                            style: TextStyle(
                              fontFamily: "Bellota", 
                              fontWeight: FontWeight.bold,
                              color: currentTab==0?Color.fromARGB(243, 243, 209, 16):Colors.white, 
                              ),
                          ),
                        ]),
                    ),
                    SizedBox(width: 20,),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = DraftPage();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.drafts_rounded,
                            color: currentTab==1?Color.fromARGB(243, 243, 209, 16):Colors.white,
                            ),
                          Text("Draft",
                            style: TextStyle(
                              fontFamily: "Bellota", 
                              fontWeight: FontWeight.bold,
                              color: currentTab==1?Color.fromARGB(243, 243, 209, 16):Colors.white, 
                              ),
                          ),
                        ]),
                    ),
                  ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = StatusPage();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_turned_in_rounded,
                            color: currentTab==2?Color.fromARGB(243, 243, 209, 16):Colors.white,
                            ),
                          Text("Status",
                            style: TextStyle(
                              fontFamily: "Bellota", 
                              fontWeight: FontWeight.bold,
                              color: currentTab==2?Color.fromARGB(243, 243, 209, 16):Colors.white, 
                              ),                          
                          ),
                        ]),
                    ),
                    SizedBox(width: 20,),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = ProfilePage();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab==3?Color.fromARGB(243, 243, 209, 16):Colors.white,
                            ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontFamily: "Bellota", 
                              fontWeight: FontWeight.bold,
                              color: currentTab==3?Color.fromARGB(243, 243, 209, 16):Colors.white, 
                              ),
                              
                            ),
                        ]),
                    ),
                  ],
                  ),
              ),           
            ],
          ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context).push(_swipeUpRoute());
        },
        backgroundColor: Color.fromARGB(243, 243, 209, 16),
        child: Icon(Icons.add),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );


  }
}

Route _swipeUpRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyFormPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );        
    },
  );
}