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
  String registered;
  String name = "";
  final _database=FirebaseDatabase.instance.reference();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _database.child('/count').onValue.listen((event) {
      setState(() {
        registered = event.snapshot.value['c'].toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (qrString=="Not Scanned")?Text(
            qrString,
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ):Text(""),
          (qrString=="VALID QR")?Text(
            qrString,
            style: TextStyle(color: Colors.green, fontSize: 30),
          ):Text(""),
          (qrString=="Expired QR")?Text(
            qrString,
            style: TextStyle(color: Colors.red, fontSize: 30),
          ):Text(""),
          Text(
            registered,
            style: TextStyle(color: Colors.blue, fontSize: 50),
          ),
          Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          ElevatedButton(
            onPressed: (){
              scanQR();
          },
            child: Text("Scan QR Code"),
          ),
          SizedBox(width: width),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter UniqueID',
              hintText: 'UNIQUE-ID',
            ),
            onSubmitted: (value){
              scan(value);

            },
          )
        ],
      ),
    );
  }

  Future<void> scanQR() async {

      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, ScanMode.QR).then((value) {
        setState(() {
          verified = false;
          qrString = "Not scanned";
        });
        // print(value);
        _database.child('/Sheet2/${value}/').onValue.listen((event) {

          final String nextOrder=event.snapshot.value['Count'].toString()[0];
          // print("---->${nextOrder}");
          if(nextOrder=='1' && !verified){
            setState(() {
              qrString = "Expired QR";
              name = value + " " + event.snapshot.value['Student Name'].toString();

              //print(nextOrder);
            });
            return;
          }else if(nextOrder=='0' || verified){
            if(!verified){
              // print("updated");
              _database.child('/Sheet2/${value}/').update({
                'Count':'1'
              });
              _database.child('/count').update({'c':int.parse(registered)+1});

            }
// print("----------");
            setState(() {
              // print("###");
              name = value + " " + event.snapshot.value['Student Name'].toString();

              qrString = "VALID QR";
              verified = true;
              //print(nextOrder);
            });
            // print("###return");
            return;
          }


        });
      });
      return;

  }
  Future<void> scan(String val) async {
    setState(() {
      name="";
      qrString="Not Scanned";
      verified=false;
    });
    String value =val.toUpperCase();
    // print("--------------");
    // print(value);
    _database.child('/Sheet2/${value}/').onValue.listen((event) {

      final String nextOrder=event.snapshot.value['Count'].toString()[0];
      // print("---->${nextOrder}");
      if(nextOrder=='1' && !verified){
        setState(() {
          qrString = "Expired QR";
          name = value + " " + event.snapshot.value['Student Name'].toString();

          //print(nextOrder);
        });
        return;
      }else if(nextOrder=='0' || verified){
        if(!verified){
          // print("updated");
          _database.child('/Sheet2/${value}/').update({
            'Count':'1'
          });
          _database.child('/count').update({'c':int.parse(registered)+1});

        }
// print("----------");
        setState(() {
          // print("###");
          name = value + " " + event.snapshot.value['Student Name'].toString();

          qrString = "VALID QR";
          verified = true;
          //print(nextOrder);
        });
        // print("###return");
        return;
      }


    });
    return;
  }
}