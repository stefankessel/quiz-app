import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<num> result;
  const ResultScreen({Key? key, required this.result}) : super(key: key);

  num getResult() {
   num r = 0;
   for (var element in result) {r += element;}
   return r;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          getResult().toString(),
        ),
      ),
    );
  }
}
