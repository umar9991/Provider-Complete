

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_1/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),

             TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
            ),
          SizedBox(
            height: 40,
          ),
            InkWell(
              onTap: () {
                authProvider.login(emailController.text.toString(),
                 passwordController.text.toString());
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:authProvider.loading?CircularProgressIndicator(color: Colors.white,): Center(child: Text("Login")),
              
              ),
            )
          ],
        ),
      ),
    );
  }
}