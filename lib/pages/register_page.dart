import 'package:flutter/material.dart';
import 'package:siya/widgets/general_logo_space.dart';
import 'package:siya/theme.dart';
import 'package:siya/widgets/button_primary.dart';
import 'login_page.dart';

class RegisterPages extends StatefulWidget {
  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
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
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 25,
                    fontWeight:
                        FontWeight.bold, // Add this line to make the text bold
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Register new account",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 18, // Add this line to make the text bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: Colors.green.shade100,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full name",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.green.shade400,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: Colors.green.shade100,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.green.shade400,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: Colors.green.shade100,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.green.shade400,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: Colors.green.shade100,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    obscureText: _secureText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: showHide,
                          icon: _secureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.green.shade400,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: Colors.green.shade100,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    obscureText: _secureText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: showHide,
                          icon: _secureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.green.shade400,
                        )),
                  ),
                ),
                SizedBox(
                    height: 30
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ButtonPrimary(
                    text: "REGISTER",
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(), // Replace LoginPage with your actual page name
                          ),
                        );
                      },
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          color: Colors.green.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
