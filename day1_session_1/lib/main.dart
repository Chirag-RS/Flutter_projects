import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          appBar: AppBar(title: Text("Sunrise"),) ,
          backgroundColor: Colors.black38,
          body:
          Column(

            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Image(
                  image: AssetImage('images/sunrise1.jpg'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Image(
                  image: AssetImage('images/sunrisre2.jpg'),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Image(
                    image: AssetImage('images/sunrise3.jpg'),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}



