import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function functionHalder;
  final String answerText;
  AnswerButton(this.functionHalder, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: () {
          functionHalder();
        },
      ),
    );
  }
}
