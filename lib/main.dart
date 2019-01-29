import 'package:flutter/material.dart';
import 'package:qr_code_scanner/scanner.dart';
import 'package:qr_code_scanner/generator.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

Scanner scanner;
Generator generator;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: QRScan(),
    );
  }
}

class QRScan extends StatefulWidget {
  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("QR Code Scanner"),),
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Scanner()));
                },
                child: Text("Scan QR Code"),
              ),
              new RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Generator()));
                },
                child: Text("Generate QR Code"),
              )
            ],
          ),
        ),
      );
  }
}