import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'log_In_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const simpleApp());
}
