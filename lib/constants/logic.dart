import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:siya/pages/login_page.dart';

import '../pages/verify_email_screen.dart';

class Logic extends StatelessWidget {
  const Logic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if (snapshot.hasData){
              return const VerifyEmailScreen();
            }
            else {
              return LoginPage();
            }
          },
        )
    );
  }
}