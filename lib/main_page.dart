import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:siya/constants.dart';
import 'package:siya/global_bloc.dart';
import 'package:siya/pages/profile_page.dart';
import 'package:siya/pages/home_page.dart';
import 'package:siya/pages/history_page.dart';
import 'package:siya/pages/store_page.dart';
import 'package:siya/pages/reminder_page.dart';
import 'package:sizer/sizer.dart';

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
    SearchResultScreen(),
    ProfilePage(),
  ];

  onTappedItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  GlobalBloc? globalBloc;
  @override
  void initState() {
    // TODO: implement initState
    // newEntryBloc = AddReminderBloc();
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
        value: globalBloc!,
        child: Sizer(builder: (context,orientation, deviceType){
    return MaterialApp(
      color: Colors.green[300],
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldColor,
        //appbar theme
        appBarTheme: AppBarTheme(
          toolbarHeight: 7.h,
          backgroundColor: kScaffoldColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: kSecondaryColor,
            size: 20.sp,
          ),
          titleTextStyle: GoogleFonts.mulish(
            color: kTextColor,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            fontSize: 16.sp,
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28.sp,
            color: kGreenSecondaryColor,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: kTextColor,
          ),
          titleSmall: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
            color: kGreenSecondaryColor,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: 13.sp,
            color: kTextColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          displayLarge:
          GoogleFonts.poppins(fontSize: 15.sp, color: kPrimaryColor),
          displayMedium:
          GoogleFonts.poppins(fontSize: 12.sp, color: kTextLightColor),
          bodySmall: GoogleFonts.poppins(
            fontSize: 9.sp,
            fontWeight: FontWeight.w400,
            color: kTextLightColor,
          ),
          labelMedium: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextLightColor,
              width: 0.7,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: kTextLightColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
        //lets customize the timePicker theme
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.green.shade100,
          hourMinuteColor: kGreenSecondaryColor,
          hourMinuteTextColor: kScaffoldColor,
          dayPeriodColor: kGreenSecondaryColor,
          dayPeriodTextColor: kScaffoldColor,
          dialBackgroundColor: kGreenSecondaryColor,
          dialHandColor: Colors.green.shade100,
          dialTextColor: kScaffoldColor,
          entryModeIconColor: kOtherColor,
          dayPeriodTextStyle: GoogleFonts.aBeeZee(
            fontSize: 8.sp,
          ),
        ),
      ),
      home: Scaffold(
        body: _pageList.elementAt(_selectIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          // Set the background color to transparent
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.storefront), label: "Store"),
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm_add_outlined), label: "Reminder"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Profile"),
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
      ),
    );
        }
        ),
    );
  }
}
