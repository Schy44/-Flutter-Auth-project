import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

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
              Text("Sign up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text("Create your account", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 30),
              _inputField("Username", _username),
              _inputField("Email", _email, keyboard: TextInputType.emailAddress),
              _inputField("Password", _password, obscure: true),
              _inputField("Confirm Password", _confirmPassword, obscure: true),
              SizedBox(height: 20),
              ElevatedButton(
                style: _buttonStyle(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: Text("Sign up"),
              ),
              Text("Or"),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  side: BorderSide(color: Colors.purple),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Sign In with Google"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Login", style: TextStyle(color: Colors.purple)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController controller,
      {bool obscure = false, TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: label,
          filled: true,
          fillColor: Colors.purple.shade50,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
        validator: (value) {
          if (value!.isEmpty) return 'Enter $label';
          if (label == "Confirm Password" && value != _password.text) return "Passwords do not match";
          if (label == "Email" && !value.contains('@')) return "Invalid email";
          return null;
        },
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
