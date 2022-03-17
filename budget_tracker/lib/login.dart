import 'package:budget_tracker/all_panels.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/all_panels.dart';

class Login extends StatelessWidget {
  String? _email = "";
  String? _password = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          // checks if input is empty
          return 'Email is Required';
        } else if (!RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(value)) {
          return 'Please enter a valid email.';
        }
        return null;
      },
      onSaved: (String? value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (String? value) {
        if (value!.isEmpty) {
          // checks if input is empty
          return 'Password is Required';
        } else if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
            .hasMatch(value)) {
          return 'Please enter a valid password.';
        }
        return null;
      },
      onSaved: (String? value) {
        _password = value;
      },
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // LOGIN AUTHENTICATION HERE
              }
            },
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              /*Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );*/
            },
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Login')),
        ),
        body: FutureBuilder(
          //future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: const [
                  Text('Login'),
                ],
              );
            }
            return Center(
                child: SizedBox(
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _buildEmail(),
                    _buildPassword(),
                    _buildButtons(),
                  ],
                ),
              ),
              //CircularProgressIndicator(),
            ));
          },
        ));
  }
}
