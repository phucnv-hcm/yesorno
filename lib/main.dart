import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const[
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Amazone', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Zing', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Who created HopLuc Store?',
      'answers': [
        {'text': 'Van Tuan', 'score': -2},
        {'text': 'Van Em', 'score': 10},
        {'text': 'Van Phuc', 'score': -2},
        {'text': 'Van An', 'score': -2},
      ],
    },
    // ToDo: Add a question has only two options

  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('we have question!');
    } else {
      print('No more question!');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz App'),
          backgroundColor: Colors.black12,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length ?
          Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) : Result(
            _totalScore, _resetQuiz),
        ),
      ),
    );
  }
}







