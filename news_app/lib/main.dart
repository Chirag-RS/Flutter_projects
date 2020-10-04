import 'dart:convert';

import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'newsdetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

   List data ;
  Future<String> fetchData() async{
    var json = await http.get("http://newsapi.org/v2/everything?q=tech&apiKey=c3ebb4ed10cc42daba5c32eb50d425e7");

    var fetchdata = jsonDecode(json.body);
    setState(() {
      data=fetchdata["articles"];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Tech News',
          style: TextStyle(
            fontFamily: 'NewRocker',
            fontStyle: FontStyle.normal
            //fontStyle: FontStyle.italic
          ),
          )
          ),
          elevation: 5,
        ),
        body: Swiper(
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NewsDetailsPage(
                    author:data[index]["author"],
                    title:data[index]["title"],
                    description:data[index]["description"],
                    urlToImage:data[index]["urlToImage"],
                    publishedAt:data[index]["publishedAt"]
                  )
                ));
              },
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0)
                      ),
                      child: Image.network(data[index]["urlToImage"],
                      fit:BoxFit.cover,
                        height: 400.0,
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 270, 0, 0),
                    child: Container(
                      width: 400,
                      height: 400,
                      child: Material(
                        borderRadius: BorderRadius.circular(35),
                        elevation: 10,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text(
                                data[index]["title"],
                                style: TextStyle(
                                  fontFamily: 'NewsCycle',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
            );

          },
          itemCount: data==null ? 0:data.length,
          autoplay: true,
          viewportFraction: 0.8,
          scrollDirection: Axis.vertical,
          scale: 0.9,
        )
      )
    );
  }
}
