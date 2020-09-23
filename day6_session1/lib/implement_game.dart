import 'game.dart';

class GameData{
  List<Game> _gameFlow =[
         //Game[0]
    Game(title: 'A little bit of a backstory..'
        'You are on a trip to a deserted place and lose your way and end up in a dense forest.'
        'You get tensed,start wandering around and shouting for help..'
        'after hours of trying to find a way out,you bump into two people who are roaming as if they have lived there for years.'
        'You ask them for a way out but all you get is \'Ignorance\'.  What do you do?   ',
        choice1:'Feel suspicious.  ',
        choice2:'Ask for help again in a different way'),
         //GAme[1]
    Game(title: 'You keep wandering and at a distance,you can hear to sounds of a train passing by,you start walking towards the sound of the train.'
        'After walking for quite sometime, you see a sign board saying\'Danger Ahead\' and a sign showing the closest city is in the reverse direction from where you came.What do you do? ',
        choice1:'Believe in yourself and keep walking towards the sounds',
        choice2:'Follow the signs and start walking back'),
       //Game[2]
    Game(title: 'Turns out they could not understand the language you speak.',
        choice1:'Persistence is the key.'
            'Keep trying to ask for help using hand signs or a different language',
        choice2:'Find your own way'),
         //Game[3]
    Game(title: 'That\'s Great! You believed in yourself and that didn\'t let you down and you have found your way out!',
        choice1:'Restart',
        choice2:''),
        //Game[4]
    Game(title: 'Oops! That doesn\'t seem to be the right path.'
        'Better luck next time.',
        choice1: 'Restart',
        choice2: ''),
        //game[5]
    Game(title: 'Good! You were persistent with the efforts and that finally paid off and they will help your way out. ',
        choice1:'Restart',
        choice2:''),
       //Game[6]
    Game(title: 'You showed good perseverance! You have found yourself a way out.',
        choice1: 'Restart',
      choice2: ''
    )
  ];

  int _storyNumber =0;
  String getStory()
  {
    return _gameFlow[_storyNumber].title;
  }

  String getChoice1()
  {
    return _gameFlow[_storyNumber].choice1;
  }

  String getChoice2()
  {
    return _gameFlow[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber)
  {
   if(choiceNumber==1 && _storyNumber==0)
     {
       _storyNumber=1;
     }
    else if(choiceNumber == 2 && _storyNumber==0)
     {
       _storyNumber=2;
     }
    else if(choiceNumber == 1 && _storyNumber==1)
      {
        _storyNumber=3;
      }
    else if(choiceNumber==2 && _storyNumber == 1)
      {
        _storyNumber=4;
      }
    else if(choiceNumber==1 && _storyNumber == 2)
      {
        _storyNumber=5;
      }
    else if(choiceNumber==2 && _storyNumber == 2)
      {
        _storyNumber=6;
      }

     else if(_storyNumber == 3 || _storyNumber ==4 || _storyNumber== 5 || _storyNumber==6)
     {
       restart();
   }
     }
     void restart()
     {
       _storyNumber=0;
     }

     bool buttonVisible(){
    if(_storyNumber>3){
      return true;
    }else{
      return false;
    }
  }
}

