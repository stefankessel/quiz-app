import 'package:flutter/material.dart';

import 'package:my_bravo_quiz_app/models/question_model.dart';

class MyOption extends StatelessWidget {
  final Question question;
  final ValueChanged onClickOption;

  const MyOption(
      {Key? key, required this.question, required this.onClickOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo scollen geht nicht - Placeholder()
    return Column(
      children: question.options.map((option) {
        return buildOption(option);
      }).toList(),
    );
  }

  Widget buildOption(Option option) {
    return GestureDetector(
      onTap: () => onClickOption(option),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(option.text),
      ),
    );
  }
}
