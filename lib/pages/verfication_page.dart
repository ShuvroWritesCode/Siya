import 'package:flutter/material.dart';
import 'package:siya/pages/reset_password.dart';
import 'package:siya/widgets/general_logo_space.dart';
import 'package:siya/widgets/button_primary.dart';
import 'package:siya/pages/home_page.dart';

class VerificationCodePage extends StatefulWidget {
  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  TextEditingController digit1Controller = TextEditingController();
  TextEditingController digit2Controller = TextEditingController();
  TextEditingController digit3Controller = TextEditingController();
  TextEditingController digit4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: GeneralLogoSpace(),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification Code",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Enter the 4-digit verification code sent to your email.",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDigitInput(digit1Controller),
                    buildDigitInput(digit2Controller),
                    buildDigitInput(digit3Controller),
                    buildDigitInput(digit4Controller),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ButtonPrimary(
                    text: "Verify",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDigitInput(TextEditingController controller) {
    return Container(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.green.shade900,
        ),
        decoration: InputDecoration(
          fillColor: Colors.green.shade100, // Set the background color here
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
