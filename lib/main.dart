import 'package:app_new/quiz.dart';
import 'package:app_new/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'Text': 'Red', 'score': 10},
        {'Text': 'Green', 'score': 5},
        {'Text': 'Black', 'score': 3},
        {'Text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'Text': 'Lion', 'score': 9},
        {'Text': 'Elephant', 'score': 5},
        {'Text': 'Rabbit', 'score': 3},
        {'Text': 'Snake', 'score': 11},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'Text': 'Ahmed', 'score': 1},
        {'Text': 'Max', 'score': 1},
        {'Text': 'Mohamed', 'score': 1},
        {'Text': 'Kwama', 'score': 1},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resultQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['hello'];
    // dummy.add('max');
    // print(dummy);

    // questions = []; //dose not work if questions is a const
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          backgroundColor: Colors.deepPurple,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resultQuiz),
      ),
    );
  }
}
