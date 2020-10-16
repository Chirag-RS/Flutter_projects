import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp_bloc/helper/data.dart';
import 'package:flutterapp_bloc/helper/news.dart';
import 'package:flutterapp_bloc/models/article_model.dart';
import 'package:flutterapp_bloc/models/category_model.dart';
import 'package:flutterapp_bloc/views/article_details.dart';
import 'package:flutterapp_bloc/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModels> categories = List<CategoryModels>();
  List<ArticleModel> articles = List<ArticleModel>();
   bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async
  {
    News news = News();
    await news.getNews();
    articles =news.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8) ,
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                      return Categories(
                      imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                      }),
                ),
                //articles
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
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
          ) ,
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {

  final String imageUrl, categoryName;
  Categories({this.categoryName,this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(
            category: categoryName.toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,width: 120,height: 60,fit: BoxFit.cover,)
            ),
          Container(
            alignment: Alignment.center,
            width: 120,
              height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black12
            ),
            child: Text(
              categoryName,
              style: TextStyle(
                  fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
            ),
          )
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title,imageUrl,description,url;
  DetailsPage({@required this.imageUrl,@required this.url,@required this.description,@required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(
            builder:(context) => ArticleNews(
           articleUrl: url,
            ) ));
      },
      child: Container(
        //margin:EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)
            ),
            SizedBox(height: 8,),
            Text(title,
            style: TextStyle(
                fontSize: 17,
              color: Colors.black87,
                fontWeight: FontWeight.w600
            ),
            ),
            SizedBox(height: 6,),
            Text(description,
            style: TextStyle(
              color: Colors.black54
            ),)
          ],
        ),
      ),
    );
  }
}


