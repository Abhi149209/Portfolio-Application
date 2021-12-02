// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  double height, width;
  String qrString = "Not Scanned";
  bool verified = false;
  final _database=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            qrString,
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
          ElevatedButton(
            onPressed: scanQR,
            child: Text("Scan QR Code"),
          ),
          SizedBox(width: width),
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    try {
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, ScanMode.QR)
          .then((value) {
        setState(() {
          verified = false;
          qrString = "Not scanned";
        });
        print(value);
        _database.child('/1s1RE_npjE-WKMFIffDad9sRF9NKZUu7_sbdaKsD6kA8/Sheet1/${value}/').onValue.listen((event) {

          final String nextOrder=event.snapshot.value['Count'].toString();
          print(nextOrder);
          if(nextOrder=='1' && !verified){
            setState(() {
              qrString = "Expired QR";

              //print(nextOrder);
            });
          }else if(nextOrder=='0' || verified){
            _database.child('/1s1RE_npjE-WKMFIffDad9sRF9NKZUu7_sbdaKsD6kA8/Sheet1/${value}/').update({
              'Count':'1'
            });
            setState(() {
              qrString = "VALID QR";
              verified = true;
              //print(nextOrder);
            });
          }


        });
      });
    } catch (e) {
      setState(() {
        qrString = "unable to read the qr";
      });
    }
  }
}