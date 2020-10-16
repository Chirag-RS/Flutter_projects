import 'package:flutter/material.dart';
import 'package:flutterapp_bloc/helper/news.dart';
import 'package:flutterapp_bloc/models/article_model.dart';

import 'home.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoriesNews();
  }
  getCategoriesNews() async
  {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      body: _loading? Center(
        child: Container(
        child: CircularProgressIndicator(),
      ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder:(context,index){
                      return DetailsPage(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          description: articles[index].description,
                          url: articles[index].url
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
