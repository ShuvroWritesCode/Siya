import 'package:flutter/material.dart';
import 'package:siya/pages/register_page.dart';
import 'package:siya/widgets/button_primary.dart';
import 'package:siya/widgets/general_logo_space.dart';
import 'package:siya/widgets/widget_illustration.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralLogoSpace(
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            WidgetIllustration(
              image: "assets/splash_ilustration.png",
              title: "SIYA: Health Companion",
              subtitle1: "Your Prescription",
              subtitle2: "for Health and Convenience",
              child: ButtonPrimary(
                text: "GET STARTED",
                onTap: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RegisterPages()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
