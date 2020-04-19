import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function onAnswerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz({
    @required this.onAnswerQuestion,
    @required this.questions,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map(
          (answer) {
            return Answer(
                () => onAnswerQuestion(answer['score']), answer['text']);
          },
        ).toList(),
      ],
    );
  }
}
