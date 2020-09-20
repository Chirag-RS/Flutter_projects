import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'implementation.dart';
 Quiz quiz =Quiz();

 void main() {
   runApp(Quizzler());
 }

 class Quizzler extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         backgroundColor: Colors.black54,
         body: SafeArea(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 10.0),
             child: QuizPage(),
           ),
         ),
       ),
     );
   }
 }

 class QuizPage extends StatefulWidget {
   @override
   _QuizPageState createState() => _QuizPageState();
 }

 class _QuizPageState extends State<QuizPage> {
   List<Widget> keeper =[];
   int score = 0 ;

   void checkAns(bool val)
   {
     bool correct = quiz.getAnswer();
     setState(() {
       if(quiz.quizCompleted() == true) {
         Alert(
             context: context,
             title: "Finished",
             desc: "You\'ve reached the end of the quiz. Your score is $score"
         ).show();

         quiz.restartQuiz();

         keeper = [];
       }
       else{
         if(val == correct){
           keeper.add(Icon(
             Icons.check,
             color: Colors.green,
           ));
           score++;
         }
         else{
           keeper.add(Icon(
             Icons.close,
             color: Colors.red,
           ));
         }
         quiz.nextQuestion();
       }
     });
   }
   @override
   Widget build(BuildContext context) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Expanded(
           flex: 5,
           child: Padding(
             padding: EdgeInsets.all(10.0),
             child: Center(
               child: Text(
                 quiz.getQuestion(),
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 25,
                   color: Colors.white
                 ),
               ),
             ),
           ),
         ),
         Expanded(
           child: Padding(
             padding: EdgeInsets.all(15),
             child: FlatButton(
               textColor: Colors.white,
               color: Colors.green,
               child: Text(
                 "True",
                 style:TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 ),
               ),
               onPressed: (){
                 checkAns(true);
               },
             ),
           ),
         ),Expanded(
           child: Padding(
             padding: EdgeInsets.all(15),
             child: FlatButton(
               textColor: Colors.white,
               color: Colors.red,
               child: Text(
                 "False",
                 style:TextStyle(
                     color: Colors.white,
                     fontSize: 20
                 ),
               ),
               onPressed: (){
                 checkAns(false);
               },
             ),
           ),
         ),
         Row(
           children: keeper,
         )
       ],
     );
   }
 }

