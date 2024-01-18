import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the Provider package
import 'package:siya/constants/routes.dart';
import 'package:siya/local_notifications.dart';
import 'package:siya/pages/add_reminder_bloc.dart';
import 'package:siya/pages/add_reminder_page.dart';
import 'package:siya/pages/booking_screen.dart';
import 'package:siya/pages/calendar_screen.dart';
import 'package:siya/pages/custom_marker_info_window.dart';
import 'package:siya/pages/edit_profile_screen.dart';
import 'package:siya/pages/home_page.dart';
import 'package:siya/pages/home_screen.dart';
import 'package:siya/pages/login_page.dart';
import 'package:siya/pages/medicine_details.dart';
import 'package:siya/pages/register_page.dart';
import 'package:siya/pages/reset_password.dart';
import 'package:siya/pages/settings_screen.dart';
import 'package:siya/pages/splash_screen.dart';
import 'package:siya/pages/profile_page.dart';
import 'package:siya/main_page.dart';
import 'package:siya/pages/successful_booking_screen.dart';
import 'constants/logic.dart';
import 'firebase_options.dart';
import 'global_bloc.dart';
import 'pages/verify_email_screen.dart';
import 'package:siya/pages/logout.dart';
import 'package:siya/pages/ocr.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalNotifications.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Add the MultiProvider to provide the AddReminderBloc
    return MultiProvider(
      providers: [
        // Add your GlobalBloc provider here
        Provider<GlobalBloc>(
          create: (_) => GlobalBloc(),
        ),
        // Add your AddReminderBloc provider here
        Provider<AddReminderBloc>(
          create: (_) => AddReminderBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? loginRoute
            : homescreenRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.green.shade50,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green.shade300, // Set your desired app bar color here
          ),
        ),
        routes: {
          loginRoute: (context) => LoginPage(),
          logout: (context) => LogoutWidget(),
          logicRoute: (context) => const Logic(),
          registerRoute: (context) => RegisterPages(),
          verifyEmailRoute: (context) => const VerifyEmailScreen(),
          resetPasswordRoute: (context) => const ResetPasswordScreen(),
          homescreenRoute: (context) => MainNavigationScreen(index: 0),
          profileRoute: (context) => MainNavigationScreen(index: 4),
          editProfileRoute: (context) => const EditProfileScreen(),
          appointmentRoute: (context) => MainNavigationScreen(index: 2),
          successRoute: (context) => const AppointmentBooked(),
          reminderRoute: (context) => MainNavigationScreen(index: 3),
          addreminderRoute: (context) => AddReminderPage(),
          // medicinedetailsRoute: (context) => MedicineDetails(medicine)
          settingsRoute: (context) => const SettingsScreen(),
          calendarRoute: (context) => const CalendarScreen(),
          bookingRoute: (context) => const BookingScreen(),
          searchRoute: (context) => MainNavigationScreen(index: 1),
          nearbypharmacyRoute: (context) => CustomMarketInfoWindow(),
          ocrRoute: (context) => OCRPage(),
        },
      ),
    );
  }
}
