import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcf8f8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cardiology',
                style: TextStyle(
                  color: Color(0xFF1b0e0e),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // استخدم هنا textAlign
              ),
              SizedBox(height: 20),
              Text(
                'Welcome back',
                style: TextStyle(
                  color: Color(0xFF1b0e0e),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // استخدم هنا textAlign
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Color(0xFFf3e7e7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(color: Color(0xFF974e4e)),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Color(0xFFf3e7e7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(color: Color(0xFF974e4e)),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Action for forgotten password
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Color(0xFF974e4e), decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action for log in
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFFfcf8f8), backgroundColor: Color(0xFFe61919),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text('Log in'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Action for sign up
                },
                child: Text(
                  'New user? Sign Up',
                  style: TextStyle(color: Color(0xFF1b0e0e)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}