// ignore: file_names
// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_assignment/homeScreen.dart';
import 'package:fire_assignment/sign_up_Screen.dart';

class simpleApp extends StatelessWidget {
  const simpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: logInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class logInScreen extends StatefulWidget {
  const logInScreen({super.key});

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 196, 4),
        title: const Center(
          child: Text(
            'Ghost App',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 0),
            child: Column(
              children: const [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Please login to continue',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'example : ghost@gmail.com',
                  suffixIcon: Icon(Icons.mail)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'At least 7 characters',
                  suffixIcon: Icon(Icons.lock_person_sharp)),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.all(10),
            child: InkWell(
              onTap: () async {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ghostScreen()),
                  );
                }).onError((error, stackTrace) {
                  // ignore: avoid_print
                  print('error : ${error.toString()}');
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 230, 196, 4),
                ),
                child: const Center(
                    child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: Row(
              children: [
                const Text(
                  'Dont have an account ? ',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signUpScreen()));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
