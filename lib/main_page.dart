import 'package:flutter/material.dart';
import 'package:siya/pages/profile_page.dart';
import 'package:siya/pages/home_page.dart';
import 'package:siya/pages/history_page.dart';
import 'package:siya/pages/store_page.dart';
import 'package:siya/pages/reminder_page.dart';

class MainPages extends StatefulWidget {
  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int _selectIndex = 0;

  final _pageList = [
    HomePage(),
    StorePage(),
    ReminderPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  onTappedItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Set the background color to transparent
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm_add_outlined), label: "Reminder"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
        currentIndex: _selectIndex,
        onTap: onTappedItem,
        unselectedItemColor: Colors.green.shade500,
        selectedItemColor: Colors.green.shade700,
        selectedFontSize: 20,
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          color: Colors.green.shade700,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
