import 'question.dart';
class Quiz {
  int _qno = 0;
  List<Questionnaire> _qbank =
  [
    Questionnaire('Mount Kilimanjaro is the highest mountain in the world?',false),
    Questionnaire('A group of swamns is known as bevy?',true),
    Questionnaire('Sydney is the capital of Australia?',false),
    Questionnaire('The star sign in capricorn is represented by a goat?',true),
    Questionnaire('Fishes cannot blink?',true),
    Questionnaire('Nepal is the only country in the world to nto have a rectangular flag?',true),
    Questionnaire('Switzerland shares borders with 4 other countries?',false),
    Questionnaire('Octopus has 5 hearts?',true)
  ];


  void nextQuestion() {
    if (_qno < _qbank.length)
      {
        _qno++;
      }
  }

  String getQuestion()
  {
    return _qbank[_qno].question;
  }

  bool getAnswer()
  {
    return _qbank[_qno].answer;
  }

  bool quizCompleted() {
    if (_qno > _qbank.length - 1) {
      return true;
    }
    else {
      return false;
    }
  }
     void restartQuiz()
    {
     _qno=0;
    }
  }
