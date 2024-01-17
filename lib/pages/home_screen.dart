import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siya/pages/add_reminder_page.dart';
import 'package:siya/pages/appointment_screen.dart';
import 'package:siya/pages/profile_page.dart';
import 'package:siya/pages/reminder_page.dart';
import 'package:siya/pages/search_screen.dart';
import '../constants/push_routes.dart';
import '../constants/routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/stack_widget.dart';

final List<Widget> _screens = [
  const HomeScreen(),
  const SearchScreen(),
  const AppointmentScreen(),
  const ReminderPage(),
  const ProfileScreen(),
];

class MainNavigationScreen extends StatefulWidget{
  MainNavigationScreen({Key? key, this.index}) : super(key: key);

  int? index;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[widget.index ?? _currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index ?? _currentIndex,
        onTap: (index){
          setState(() {
            widget.index = null;
            _currentIndex = index;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_add_outlined),
            label: 'Reminder',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget('Siya'),
      drawer: drawerWidget(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            GestureDetector(
              child: stackWidget(
                "assets/home.jpeg",
                'Click here to talk to a licensed pharmacist',
              ),
              onTap: () {
                pushRoute(context, searchRoute);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              child: stackWidget(
                'assets/calendar.jpg',
                'Click here to check your appointments',
              ),
              onTap: () {
                pushRoute(context, appointmentRoute);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              child: stackWidget(
                'assets/chat.jpeg',
                'Click here to check your reminders',
              ),
              onTap: () {
                pushRoute(context, reminderRoute);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: stackWidget(
                'assets/pharmacy.jpg',
                'Click here to find pharmacies near you',
              ),
              onTap: () {
                pushRoute(context, nearbypharmacyRoute);
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
