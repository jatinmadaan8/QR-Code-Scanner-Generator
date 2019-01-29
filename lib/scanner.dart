import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scanner"),),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new RaisedButton(
              onPressed: scan,
              child: Text("Start Camera Scan"),
            ),
            SizedBox(height: 20.0,),
            new Container(
              child: new Column(
                children: <Widget>[
                  new DecoratedBox(
                    decoration: BoxDecoration(
                      border: new Border.all(color: Colors.black),
                    ),
                    child: new Text(barcode,style: TextStyle(fontSize: 15.0),),
                  ),
                  SizedBox(height: 10.0,),
                  new FloatingActionButton(
                    child: Icon(Icons.content_copy),
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(text: barcode));
                    },
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {this.barcode = barcode;});
    } on PlatformException catch(e){
      if(e.code ==BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = "The user did not grant the camera permission!";    
        });
      }
      else {
        setState(() => this.barcode = "Unknown error: $e");
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = "Unknown error: $e");
    }
  }
}