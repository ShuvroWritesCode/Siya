import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/push_routes.dart';
import '../constants/routes.dart';

Future<String?> getNameFromFirestore(String email) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(email);
  final userSnapshot = await userRef.get();
  if (userSnapshot.exists) {
    final userData = userSnapshot.data() as Map<String, dynamic>;
    final name = userData['username'] as String?;
    return name;
  }
  return null;
}

Widget drawerWidget(BuildContext context) {
  void pushReplacementNamedRoute(String route) {
    pushReplacementRoute(context, route);
  }

  return Drawer(
    elevation: 0,
    child: FutureBuilder<String?>(
      future: getNameFromFirestore(
          FirebaseAuth.instance.currentUser!.email.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LinearProgressIndicator());
        } else if (snapshot.hasData) {
          final name = snapshot.data!;
          final email = FirebaseAuth.instance.currentUser!.email.toString();
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                        height: 75,
                        width: 75,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Hello, $name',
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '@$email',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 10,
                thickness: 3,
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.home),
                title: const Text("Home"),
                iconColor: Colors.green,
                onTap: () {
                  pushRoute(context, homescreenRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month_outlined),
                title: const Text("Calendar"),
                iconColor: Colors.green,
                onTap: () {
                  pushRoute(context, calendarRoute);
                },
              ),
              const Divider(
                height: 10,
                thickness: 3,
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text("Settings"),
                iconColor: Colors.green,
                onTap: (){
                  pushRoute(context, settingsRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sign Out"),
                iconColor: Colors.green,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  pushReplacementNamedRoute(loginRoute);
                },
              ),
              const Divider(
                height: 10,
                thickness: 3,
              ),
            ],
          );
        } else {
          return const SnackBar(
            content: Text("Username Not Found!"),
            elevation: 0,
          );
        }
      },
    ),
  );
}
