import 'package:flutter/material.dart';
import 'package:siya/widgets/general_logo_space.dart';
import 'package:siya/widgets/button_primary.dart';
import 'package:siya/pages/home_page.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showNewPassword = false;
  bool showConfirmPassword = false;

  void toggleNewPasswordVisibility() {
    setState(() {
      showNewPassword = !showNewPassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      showConfirmPassword = !showConfirmPassword;
    });
  }

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
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Enter your new password and confirm it.",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildPasswordInput(
                  newPasswordController,
                  "New Password",
                  showNewPassword,
                  toggleNewPasswordVisibility,
                ),
                SizedBox(
                  height: 10,
                ),
                buildPasswordInput(
                  confirmPasswordController,
                  "Confirm Password",
                  showConfirmPassword,
                  toggleConfirmPasswordVisibility,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ButtonPrimary(
                    text: "Reset Password",
                    onTap: () {
                      // Add your reset password logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
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

  Widget buildPasswordInput(
      TextEditingController controller,
      String hintText,
      bool obscureText,
      VoidCallback toggleVisibility,
      ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 20,
          color: Colors.green.shade700,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.green.shade400,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.green.shade700,
            ),
            onPressed: toggleVisibility,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.green.shade100,
        ),
      ),
    );
  }
}
