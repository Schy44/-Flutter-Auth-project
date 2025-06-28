import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome Back", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text("Enter your credential to login", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 30),
              _inputField("Username", _username),
              _inputField("Password", _password, obscure: true),
              SizedBox(height: 20),
              ElevatedButton(
                style: _buttonStyle(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot password?", style: TextStyle(color: Colors.purple)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                    child: Text("Sign Up", style: TextStyle(color: Colors.purple)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController controller, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: label,
          filled: true,
          fillColor: Colors.purple.shade50,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
        validator: (value) => value!.isEmpty ? 'Enter $label' : null,
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      minimumSize: Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }
}
