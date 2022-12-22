import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final _totalScore;
  final VoidCallback quizHandler;
  ResultWidget(this._totalScore, this.quizHandler);

  String get _resultPhrase {
    return 'Your score is ${_totalScore}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            _resultPhrase,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: quizHandler,
            child: Text(
              'Restart Quiz?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
