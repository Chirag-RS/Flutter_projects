import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleNews extends StatefulWidget {

  final String articleUrl;
  ArticleNews({this.articleUrl});
  @override
  _ArticleNewsState createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",
              style: TextStyle(color: Colors.black),),
            Text(
              "Daily",
              style:TextStyle(
                  color: Colors.red
              ) ,
            )
          ],
        ),
        actions: [
          Opacity(
          opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save,
              color: Colors.black,),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.articleUrl ,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
