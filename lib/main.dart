
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Myhome.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    child:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GLBITM App",
      //initialRoute: "/",
      home: ScanScreen(),
//
//    },
    );

  }

}