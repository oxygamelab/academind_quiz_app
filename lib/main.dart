import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favouriye color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        }
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 2,
        },
        {
          'text': 'Snake',
          'score': 1,
        },
        {
          'text': 'Elephant',
          'score': 5,
        },
        {
          'text': 'Lion',
          'score': 10,
        }
      ],
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
        {
          'text': 'Max',
          'score': 10,
        },
        {
          'text': 'Max',
          'score': 10,
        },
        {
          'text': 'Max',
          'score': 10,
        },
        {
          'text': 'Max',
          'score': 10,
        }
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _onAnswerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hi boss..'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                onAnswerQuestion: _onAnswerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
