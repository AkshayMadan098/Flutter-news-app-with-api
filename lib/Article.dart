import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Article extends StatefulWidget {
  var details, head;
  Article(this.details, this.head);
  @override
  _ArticleState createState() => _ArticleState(details, head);
}

class _ArticleState extends State<Article> {
  var details, head;
  _ArticleState(this.details, this.head);
  shareButton() {
    return GestureDetector(
      child: Icon(Icons.share),
      onTap: () {setState(() {
        Share.share('${details['title']}\n${details['url']}');
      });},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(head),
        actions: <Widget>[shareButton(), Padding(padding: EdgeInsets.all(6),)],
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('${details['title']}', style: TextStyle(fontSize: 30)),
              Padding(padding: EdgeInsets.all(20)),
              Container(
                height: 200,
                width: 400,
                child: details['urlToImage'] == null ? Text('No Image Available', style: TextStyle(fontSize: 25)) : Image.network(details['urlToImage']),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Text('Source: ${details['source']['name']}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              Text('Date: ${details['publishedAt']}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(5)),
              Text('${details['content']}', style: TextStyle(fontSize: 20),),
              Padding(padding: EdgeInsets.all(5)),
              
              
              RaisedButton(
                child: Text("Read full artucle",style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: ()=>launch(details['url']),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}