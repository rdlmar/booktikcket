import 'package:bookticket/Screens/bottom_bar.dart';
import 'package:bookticket/sign_up_page.dart';
import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPasswordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


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
                  Container(
                    width: AppLayout.getWidth(200),
                    height: AppLayout.getHeight(200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey, // Ganti dengan warna yang diinginkan
                      image: DecorationImage(
                        image: AssetImage('assets/images/img_1.png'), // Ganti dengan path gambar Anda
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(AppLayout.getHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login', style: Styles.headLineStyle,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(40)),
                  Center(
                    child: Container(
                      width: AppLayout.getWidth(300),
                      child: TextField(
                        controller: _emailController, // Tambahkan controller ini
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppLayout.getHeight(20)),
                  Center(
                    child: Container(
                      width: AppLayout.getWidth(300),
                      child: TextField(
                        controller: _passwordController, // Tambahkan controller ini
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                  ),
                  Gap(AppLayout.getHeight(50)),
                  ElevatedButton(
                    onPressed: () async {
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      try {
                        var user = await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        print(user);
                        // Login berhasil, arahkan pengguna ke halaman utama (misalnya BottomBar)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                        );
                      } catch (e) {
                        // Login gagal, tampilkan pesan kesalahan kepada pengguna
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Login Failed'),
                              content: Text('Invalid email or password.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('Login'),
                  ),



                  Gap(AppLayout.getHeight(15)),
                  Text('Or'),
                  Gap(AppLayout.getHeight(15)),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Fungsi yang akan dijalankan saat tombol login with Google ditekan
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                    ),
                    icon: Image.asset(
                      'assets/images/g.png', // Path gambar logo Google
                      width: AppLayout.getWidth(24),
                      height: AppLayout.getHeight(24),
                    ),
                    label: Text('Login With Google'),
                  ),
                  SizedBox(height: AppLayout.getHeight(20)),
                  Text(
                    'New to Bookticket? ',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman SignUpPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
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
