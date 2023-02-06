import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanagama_app/pages/admin/inboxAdmin.dart';

import '../../constant.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

final user = FirebaseAuth.instance.currentUser!;
void SignUserOut() {
  FirebaseAuth.instance.signOut();
}
final PageStorageBucket bucket = PageStorageBucket();
Widget currentScreen = InboxAdmin();

class _AdminHomePageState extends State<AdminHomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int currentTab = 0;
  final List<Widget> screens = [
    InboxAdmin(),
    
  ];
    List<String> titleList = [
    'Inbox',
    'Done',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[currentTab],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 19, 85, 68),
        elevation: 0.0,
        actions: [IconButton(onPressed: SignUserOut, icon: Icon(Icons.info))],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Constants.primaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 9,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =InboxAdmin();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: currentTab == 0
                                  ? Color.fromARGB(243, 243, 209, 16)
                                  : Colors.white,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                fontFamily: "Bellota",
                                fontWeight: FontWeight.bold,
                                color: currentTab == 0
                                    ? Color.fromARGB(243, 243, 209, 16)
                                    : Colors.white,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = InboxAdmin();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.drafts_rounded,
                              color: currentTab == 1
                                  ? Color.fromARGB(243, 243, 209, 16)
                                  : Colors.white,
                            ),
                            Text(
                              "Draft",
                              style: TextStyle(
                                fontFamily: "Bellota",
                                fontWeight: FontWeight.bold,
                                color: currentTab == 1
                                    ? Color.fromARGB(243, 243, 209, 16)
                                    : Colors.white,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = InboxAdmin();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment_turned_in_rounded,
                              color: currentTab == 2
                                  ? Color.fromARGB(243, 243, 209, 16)
                                  : Colors.white,
                            ),
                            Text(
                              "Status",
                              style: TextStyle(
                                fontFamily: "Bellota",
                                fontWeight: FontWeight.bold,
                                color: currentTab == 2
                                    ? Color.fromARGB(243, 243, 209, 16)
                                    : Colors.white,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = InboxAdmin();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: currentTab == 3
                                  ? Color.fromARGB(243, 243, 209, 16)
                                  : Colors.white,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                fontFamily: "Bellota",
                                fontWeight: FontWeight.bold,
                                color: currentTab == 3
                                    ? Color.fromARGB(243, 243, 209, 16)
                                    : Colors.white,
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
    );
  }
}
