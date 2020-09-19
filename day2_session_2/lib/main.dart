import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.tealAccent[700],
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/football.jpg'),
                    ),
                    Text("Football",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontFamily: 'Dancing Script',
                          fontStyle: FontStyle.italic

                      ),),
                    Text("Football is a beautiful game",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.tealAccent[100],
                        fontFamily: 'Ranchers',
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(
                      height: 20,
                      child: Divider(
                        color: Colors.black,
                      ),
                      width: 200,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ListTile(
                          title: Text("FootBall",
                            style:TextStyle(
                                fontFamily: 'Dancing Script',
                                fontWeight: FontWeight.bold
                            ) ,),
                          leading: Icon(Icons.camera),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),

        )
    );
  }
}
