import 'package:flutter/material.dart';
import 'package:tinggit/screens/root_page.dart';
import 'package:tinggit/services/service_api_call.dart';
import 'package:tinggit/screens/signup.dart';
import 'package:tinggit/components/uicomponents/text_field.dart';
import 'package:tinggit/components/uicomponents/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiService _apiService = ApiService();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<void> _login() async {
    try {
      String? token = await _apiService.login(
        emailTextController.text,
        passwordTextController.text,
      );
      if (token != null) {
        // Navigate to another page or show success message
        print('Login successful, token: $token');
      }
    } catch (e) {
      print('Login failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 300, // Adjust the width to a reasonable size
                      height: 200, // Adjust the height to a reasonable size
                    ),
                  ),
                ),
                SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 0),
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                MyTextField(
                  controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 110),
                    Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(), // Placeholder for homescreen
                        // builder: (context) => ApiCalling(), // Placeholder for homescreen
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      MyButton(
                        onTap: () {
                          // _logger.info('Login button pressed');
                        },
                        text: 'Log In',
                      ),
                      const SizedBox(height: 10),
                      MyButton(
                        onTap: () {},
                        text: 'SSO Login',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
