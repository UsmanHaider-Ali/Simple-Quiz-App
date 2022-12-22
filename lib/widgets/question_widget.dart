import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final _question;
  QuestionWidget(this._question);

  @override
  Widget build(BuildContext context) {
    return Text(
      _question,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
