import 'package:flutter/material.dart';

import 'package:my_bravo_quiz_app/models/question_model.dart';
import 'package:my_bravo_quiz_app/screens/result_screen.dart';
import 'package:my_bravo_quiz_app/utils/option_widget.dart';

class MyQuestion extends StatefulWidget {
  const MyQuestion({Key? key}) : super(key: key);

  @override
  State<MyQuestion> createState() => _MyQuestionState();
}

class _MyQuestionState extends State<MyQuestion> {
  int _questionIndex = 1;
  bool _isLocked = false;
  List<num> _score = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 20),
          Text("Frage $_questionIndex/${questions.length}"),
          Divider(
            color: Colors.blueGrey,
            height: 10,
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: questions.length,
              itemBuilder: ((context, index) {
                return buildQuestionContainer(questions[index]);
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedNavigationButton(
                  const Icon(Icons.arrow_back), 'back'),
              buildElevatedNavigationButton(
                  const Icon(Icons.refresh), "refresh"),
              buildElevatedNavigationButton(
                  const Icon(Icons.arrow_forward), "forward"),
            ],
          )
        ],
      ),
    );
  }

  Column buildQuestionContainer(Question question) {
    return Column(
      children: [
        Text(
          question.text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        MyOption(
            question: question,
            onClickOption: (onClickedOption) {
              if (question.isLocked) {
                print('locked');
                return;
              } else {
                question.isLocked = true;
                setState(() {
                  _isLocked = true;
                  _score.add(onClickedOption.score);
                });
                print(_score);
              }
            }),
      ],
    );
  }

  ElevatedButton buildElevatedNavigationButton(Icon icon, String action) {
    return ElevatedButton(
      onPressed: (() {
        switch (action) {
          case 'forward':
            if (_questionIndex < questions.length) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              setState(() {
                _isLocked = false;
                _questionIndex++;
              });
            }
            else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(result: _score)));
            }
            break;
          case 'refresh':
            setState(() {
              _isLocked = false;
              questions[_score.length - 1].isLocked = false;
              _score.removeLast();
            });
            break;
          case 'back':
            _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut);
            setState(() {
              _questionIndex--;
              _isLocked = true;
            });
            break;
        }
/*
        if (_questionIndex < questions.length) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() {
            _isLocked = false;
            _questionIndex++;
          });
        }
        */
      }),
      child: icon,
    );
  }
}
