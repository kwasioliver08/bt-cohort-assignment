// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ghostScreen extends StatefulWidget {
  const ghostScreen({super.key});

  @override
  State<ghostScreen> createState() => _ghostScreenState();
}

class _ghostScreenState extends State<ghostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 196, 4),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              'Ghost App',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Biography',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Simon Riley(our founder) was born in Manchester, England to unnamed parents and a older brother named Tommy, who would often scare him when he slept. While working as an apprentice butcher, Simon saw the 9/11 attacks and joined the British military, and later became a member of the Special Air Service. He returned home in 2003, and refused to return to the military until he fixed his family, as his father was cheating on his mother, and Tommy began a drug addict. Simon managed to help Tommy break from his drug addiction, and made him marry a woman named Beth, as he kicked his father out of their home.',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.all(10),
            child: InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
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
                  'Sign out',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
              ),
            ),
          )
        ],
      )),
    );
  }
}
