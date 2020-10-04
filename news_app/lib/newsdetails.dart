import 'package:flutter/material.dart';
import 'main.dart';

class NewsDetailsPage extends StatefulWidget {
  String title, author, urlToImage, publishedAt, description;

  NewsDetailsPage(
      {this.title,
      this.author,
      this.description,
      this.publishedAt,
      this.urlToImage});

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(widget.urlToImage,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 300,0,0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:Material(
                    borderRadius: BorderRadius.circular(35),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(20.0),
                          child: Text(widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),
                          ),
                        ),
                        Text(widget.publishedAt.substring(0,10),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            widget.description,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                        Text(
                          widget.author,
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),


                      ],
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
