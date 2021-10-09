// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// void main()=>runApp(MaterialApp(
//   home:Ninja(),
//
//   ));
// class Ninja extends StatefulWidget {
//
//
//   @override
//   _NinjaState createState() => _NinjaState();
// }
//
// class _NinjaState extends State<Ninja> {
//   int ninjalevel=0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Portfolio',
//         style: TextStyle(
//
//         ),
//         ),
//         centerTitle: true,
//         backgroundColor:Colors.black,
//         elevation: 0.0,
//
//
//
//       ),
//
//       body: Column(
//         children: [
//           Center(
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.center,
//                   child: Image.asset(
//                     'asset/me.jpg',
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Show text here',
//                       style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 22.0),
//                     )),
//               ],
//             ),
//           ),
//           Text("abhinav")
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PortfolioX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}