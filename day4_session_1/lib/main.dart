import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void play(int soundNum)
  {
    final audioplayer = AudioCache();
    audioplayer.play('music$soundNum.wav');
  }

  Expanded Key({Color color, int soundNum})
  {
    return Expanded(
      child: FlatButton(
        onPressed: (){
          play(soundNum);
        },
        color: color,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black38,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Key(color: Colors.blue, soundNum:1),
                  Key(color: Colors.greenAccent, soundNum:2),
                  Key(color: Colors.purple, soundNum:3),
                  Key(color: Colors.orange, soundNum:4),
                  Key(color: Colors.red, soundNum:5),
                  Key(color: Colors.yellow, soundNum:6),

                ],
              ),
            )
        )
    );
  }
}
