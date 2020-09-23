import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'implement_game.dart';

void main() => runApp(Gambit());

class Gambit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ImplementGame(),
    );
  }
}
GameData gameData = GameData();


class ImplementGame extends StatefulWidget {
  @override
  _ImplementGameState createState() => _ImplementGameState();
}

class _ImplementGameState extends State<ImplementGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/forest.jpg'),
            fit: BoxFit.cover
          ),
          border: Border.all(
            color:Colors.black54,
            width:8.0,
          ),
            borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0,horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 10,
                child: Center(
                  child: Text(
                      gameData.getStory(),
                    style: TextStyle(
                      fontSize: 20.0
                    )
                  ),
                ),
              ),
              Expanded(
                child:FlatButton(
                  onPressed: (){
                    //choice 1 chosen
                    setState(() {
                      gameData.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    gameData.getChoice1(),
                    style: TextStyle(
                    ),
                  ),
                )
              ),
              SizedBox(height: 20.0,),
              Expanded(
                  child:FlatButton(
                    onPressed: (){
                      setState(() {
                      gameData.nextStory(2);
                      });
                    },
                    color: Colors.red,
                    child: Text(
                      gameData.getChoice2(),
                      style: TextStyle(

                      ),
                    ),
                  )
              ),
              SizedBox(height: 20.0,),
              Expanded(
                child: Visibility(
                  visible: gameData.buttonVisible(),
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        gameData.nextStory(0);
                      });
                    },
                    child: Text(
                      gameData.getChoice2(),
                      style: TextStyle(
                        fontSize: 30.0
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )

    );
  }
}



