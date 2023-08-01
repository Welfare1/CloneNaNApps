import 'package:clone_nan_app/views/home/home_structure.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Function to handle the login process
  void _handleLogin() {
    // Implement your login logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // Example of how you might handle the login process:
    if (email.isNotEmpty && password.isNotEmpty) {
      // Perform login authentication
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      print('Logged in with: $email and $password');
    } else {
      print('Please fill in both email and password');
    }
  }

  // Function to handle login with Google
  void _handleLoginWithGoogle() {
    // Implement your login with Google logic here
    print('Logged in with Google');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  // Function to handle login with Facebook
  void _handleLoginWithFacebook() {
    // Implement your login with Facebook logic here
    print('Logged in with Facebook');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 236, 236),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/nan.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            ),

            SizedBox(height: 20),

            // Login with Google button
            ElevatedButton(
              onPressed: _handleLoginWithGoogle,
              child: Text('Login with Google'),
              style: ElevatedButton.styleFrom(
                  primary:
                      Colors.redAccent), // Change the button color as needed
            ),

            SizedBox(height: 10),

            // Login with Facebook button
            ElevatedButton(
              onPressed: _handleLoginWithFacebook,
              child: Text('Login with Facebook'),
              style: ElevatedButton.styleFrom(
                  primary:
                      Colors.blueAccent), // Change the button color as needed
            ),
          ],
        ),
      ),
    );
  }
}
