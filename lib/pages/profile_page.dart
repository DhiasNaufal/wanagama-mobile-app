import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanagama_app/components/profile_widget.dart';
import 'package:wanagama_app/theme/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final user = FirebaseAuth.instance.currentUser!;

    Future<void> SignUserOut () async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/wanagama_hor.png'),
            Text(
              'Hallo, ${user.email}',
              style: TextStyle(
                fontFamily: "Bellota",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
            SizedBox(
              height: size.height * .7,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  ProfileWidget(
                    onTap: (){},
                    icon: Icons.person,
                    title: 'My Profile',
                  ),
                  ProfileWidget(
                    onTap: (){},
                    icon: Icons.settings,
                    title: 'Settings',
                  ),
                  ProfileWidget(
                    onTap: (){},
                    icon: Icons.notifications,
                    title: 'Notifications',
                  ),
                  ProfileWidget(
                    onTap: (){},
                    icon: Icons.chat,
                    title: 'FAQs',
                  ),
                  ProfileWidget(
                    onTap: (){},
                    icon: Icons.share,
                    title: 'Share',
                  ),
                  ProfileWidget(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    icon: Icons.logout,
                    title: 'Log Out',
                  ), 
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
