import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return MaterialApp(
      home:Scaffold(
        body:Stack(
          children:[
            Container(
              height:300,
              width:300,
              color:Colors.red,
            ),
            Container(
              height:250,
              width:250,
              color:Colors.yellow,

            ),
            Container(
              height:200,
              width:200,
              color:Colors.blue,
            ),
          ]
        )

      ),

    );
  }
  /*Widget build(BuildContext content) {
    return MaterialApp(
      home:Scaffold(
        floatingActionButton:FloatingActionButton(
          onPressed: () {},
          child:Text('Click'),
        )
      ),
    );
  }*/
}
