import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Untuk menyembunyikan keyboard saat area lain di layar di-tap
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: Styles.headLineStyle,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(40)),
                  Container(
                    width: AppLayout.getWidth(300),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(20)),
                  Container(
                    width: AppLayout.getWidth(300),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Create your username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(20)),
                  Container(
                    width: AppLayout.getWidth(300),
                    child: TextField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Fill with your full name',
                        prefixIcon: Icon(Icons.man),
                      ),
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(20)),
                  Container(
                    width: AppLayout.getWidth(300),
                    child: TextField(
                      obscureText: !_isPasswordVisible,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(20)),
                  Container(
                    width: AppLayout.getWidth(300),
                    child: TextField(
                      controller: mobileController,
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        hintText: 'Fill with your phone number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(20)),
                  Container(
                    width: AppLayout.getWidth(300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Input your gender',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'male',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value as String?;
                                });
                              },
                            ),
                            Icon(Icons.male),
                            SizedBox(width: 8),
                            Text('Male'),
                            SizedBox(width: 16),
                            Radio(
                              value: 'female',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value as String?;
                                });
                              },
                            ),
                            Icon(Icons.female),
                            SizedBox(width: 8),
                            Text('Female'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(25)),
                  Text(
                    'By signing up, you\'re agree to our',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  SizedBox(height: AppLayout.getHeight(10)),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman TermsAndConditions
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => TermsAndConditions()),
                      // );
                    },
                    child: Text(
                      'Terms & Conditions',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ),
                  Text(
                    'and',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman PrivacyPolicy
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                      // );
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(30)),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential =
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        var db = FirebaseFirestore.instance;
                        final user = <String, dynamic>{
                          "email": emailController.text,
                          "username": usernameController.text,
                          "fullname": fullnameController.text,
                          "password": passwordController.text,
                          "mobile": mobileController.text,
                          "gender": _gender
                        };

                        // Add a new document with a generated ID
                          await db.collection("data_user").doc(userCredential.user?.uid).set(user).then((data) {
                            print('User registered successfully');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          });

                        // Navigasi ke halaman login setelah berhasil menambahkan pengguna

                      } catch (error) {
                        print('Error during user registration: $error');
                        // Handle error case, such as displaying an error message to the user
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}