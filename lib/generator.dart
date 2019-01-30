import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class Generator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GeneratorApp(),
    );
  }
}

class GeneratorApp extends StatefulWidget {
  @override
  _GeneratorAppState createState() => _GeneratorAppState();
}

class _GeneratorAppState extends State<GeneratorApp> {

  String _dataString = "Hello from QR code Scanner and Generator!";
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentWidget(),
      resizeToAvoidBottomPadding: true,
    );
  }

  @override
  void didUpdateWidget(GeneratorApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  Widget _contentWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 30.0,
              right:20.0,
              bottom: 20.0,
            ),
            child: Container(
              height: 50.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Enter a custom message',
                        errorText: _inputErrorText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: FlatButton(
                      child: const Text('Submit'),
                      color: Colors.grey,
                      onPressed: () {
                        setState(() {
                          _dataString = _textController.text;
                          _inputErrorText = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: QrImage(
                  data: _dataString,
                  gapless: false,
                  foregroundColor: Colors.black,
                  onError: (e) {
                    print('Error: $e');
                    setState(() {
                      _inputErrorText = 'Error';
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}