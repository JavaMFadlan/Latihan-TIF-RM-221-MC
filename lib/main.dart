import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Latihan Flutter"),
        ),
      body: Container(
        color: Colors.black26,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.yellow,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Text("Belajar Flutter STTB", 
                          textAlign: TextAlign.center,
                          ),
              ),
            IntrinsicHeight( 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      height: 150,
                      )
                    ),
                    Expanded(
                    child: Container(
                      color: Colors.green,
                      )
                    )
                  ],
                ),
              ),
          ],
        ),
      ),),
    );
  }
}
