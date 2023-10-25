import 'package:flutter/material.dart';
import 'package:siya/widgets/general_logo_space.dart';
import 'package:siya/widgets/button_primary.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _secureText_password = true;
  showHide() {
    setState(() {
      _secureText_password = !_secureText_password;
    });
  }

  bool _secureText_confirm_password = true;
  showHide2() {
    setState(() {
      _secureText_confirm_password = !_secureText_confirm_password;
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
                  "Profile",
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 25,
                    fontWeight:
                    FontWeight.bold, // Add this line to make the text bold
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  "Update Your Profile",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 18, // Add this line to make the text bold
                  ),
                ),
                SizedBox(
                  height: 10,
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Gender",
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
                        hintText: "Age",
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
                        hintText: "Height",
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
                        hintText: "Weight",
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
                  height: 100,
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
                        hintText: "Previous Medical History...",
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
                    obscureText: _secureText_password,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: showHide,
                          icon: _secureText_password
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        border: InputBorder.none,
                        hintText: "New Password",
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
                    obscureText: _secureText_confirm_password,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: showHide2,
                          icon: _secureText_confirm_password
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
                    text: "Update",
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
