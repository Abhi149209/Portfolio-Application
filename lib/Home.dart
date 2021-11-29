import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:ninja/backebd.dart';
import 'package:ninja/test.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {

  String qrCodeResult = "Not Yet Scanned";
  String sub="";
  bool ans=false;
  String S="";
  int g=0;

  final _database=FirebaseDatabase.instance.reference();

  int b=-1;


  void _activateListeners() async {
   // print(subs);

    await _database.child('/1s1RE_npjE-WKMFIffDad9sRF9NKZUu7_sbdaKsD6kA8/Sheet1/CS19074/').onValue.listen((event) {

      // final nextOrder=Map<String,dynamic>.from(event.snapshot.key);
      // print(nextOrder);
      // print("666666666666666666666");

      final String nextOrder=event.snapshot.value['Count'].toString();
      final int g=event.snapshot.value['Count']+1;
      print(nextOrder);


      print(g);


      setState(() {
        S=nextOrder;
        b=g;


        //print(nextOrder);
      });
    });





  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Message displayed over here
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              sub,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),

            //Button to scan QR code
            FlatButton(
              padding: EdgeInsets.all(15),
              onPressed: () async {
                String codeSanner = await BarcodeScanner.scan();    //barcode scanner
                setState(() {
                  qrCodeResult = codeSanner;
                  sub=qrCodeResult;
                 // Check(subs:subs);

                  print(qrCodeResult);
                  print(sub);
                  ans=true;

                });
              },
              child: Text("Open Scanner",style: TextStyle(color: Colors.indigo[900]),),
              //Button having rounded rectangle border
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.indigo[900]),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            (ans)?ElevatedButton(onPressed: () async {
              await _database.child('/1s1RE_npjE-WKMFIffDad9sRF9NKZUu7_sbdaKsD6kA8/Sheet1/${sub}/').onValue.listen((event) {

                // final nextOrder=Map<String,dynamic>.from(event.snapshot.key);
                // print(nextOrder);
                // print("666666666666666666666");

                final String nextOrder=event.snapshot.value['Count'].toString();
                final int g=event.snapshot.value['Count']+1;
                print(nextOrder);


                print(g);


                S=nextOrder;
                b=g;
                (b<=1)?showDialog(
                    context: context,
                    builder: (context) {
                      print("valid");


                       print("Valid");
                      return AlertDialog(
                        title: Text('Valid'),
                        content: Text(''),

                      );
                    }):showDialog(
                    context: context,
                    builder: (context) {
                      print("INvalid");
                      return AlertDialog(
                        title: Text('INVALID'),
                        content: Text(''),

                      );
                    });
              });





            }, child: Center(child: Text("Verify"))):Text(""),

            (ans)?Text(sub):Text(""),
        ElevatedButton(
          child: Text("update"),
          onPressed: () async {
            await _database.child('/1s1RE_npjE-WKMFIffDad9sRF9NKZUu7_sbdaKsD6kA8/Sheet1/${sub}/').update({'Count':b});

          },

        ),



        ],
        ),
      ),
    );
  }
}