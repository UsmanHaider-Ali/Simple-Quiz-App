import 'package:quiz_app/widgets/button_widget.dart';
import 'package:quiz_app/widgets/question_widget.dart';
import 'package:quiz_app/widgets/result_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  int _totalScore = 0;

  final _questionList = [
    {
      'questionText': 'What is your favrite color?',
      'answers': [
        {'text': 'Black ', 'score': 10},
        {'text': 'Green ', 'score': 20},
        {'text': 'Red ', 'score': 15},
        {'text': 'White ', 'score': 5},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Lion ', 'score': 10},
        {'text': 'Tiger ', 'score': 20},
        {'text': 'Horse ', 'score': 15},
      ],
    },
    {
      'questionText': 'What is your favorite sport?',
      'answers': [
        {'text': 'Hockey ', 'score': 10},
        {'text': 'Cricket ', 'score': 20},
        {'text': 'Football ', 'score': 15},
        {'text': 'Tenis ', 'score': 5},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Practice App'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: (_questionIndex < _questionList.length)
                ? Column(
                    children: [
                      QuestionWidget(
                        _questionList[_questionIndex]['questionText'],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ...(_questionList[_questionIndex]['answers'] as List<Map>)
                          .map((answers) {
                        return AnswerButton(
                            () => _answerQuestion(answers['score']),
                            answers['text']);
                      }),
                    ],
                  )
                : ResultWidget(_totalScore.toString(), _restartQuiz),
          ),
        ),
      ),
    );
  }
}
