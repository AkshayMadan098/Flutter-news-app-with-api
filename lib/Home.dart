import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'Article.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
  String heading = 'Headlines';
  var data;
  int noOfNews = 0;
  var connectivityResult;
  bool connected;

  checkConnected() async {    
    connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        connected = true;
        getJsonData();
      });// I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        connected = true;
        getJsonData();
      });// I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        connected = false;
      });// I am connected to a wifi network.
    }
  }
  

  category(option) {
    data = null;
    switch (option) {
      case 'headlines':
        url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'Headlines';
        break;
      case 'general':
        url = 'https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'General';
        break;
      case 'business':
        url = 'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'Business';
        break;
      case 'sports':
        url = 'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'Sports';
        break;
      case 'health':
        url = 'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'Health';
        break;
      case 'entertainment':
        url = 'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'Entertainment';
        break;
      case 'science':
        url = 'https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'Science';
        break;
      case 'technology':
        url = 'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
        heading = 'Technology';
        break;
      default:
    }
    setState(() {
      url = url;
      heading = heading;
    });
    checkConnected();

  }

  Future<String> getJsonData() async {
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertData = json.decode(response.body);
      data = convertData;
      noOfNews = data['articles'].length;
    });

      print(data);
  }

  @override
  void initState() {
    checkConnected();
    // getJsonData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (connected == false) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('No Internet Connectivity', style: TextStyle(fontSize: 30),),
              MaterialButton(
                onPressed: () => exit(0),
                child: Text('Quit'),
                color: Colors.grey[200],
              ),
              MaterialButton(
                onPressed: () => checkConnected(),
                child: Text('Retry'),
                color: Colors.grey[200],
              )
            ],
        )),
      );
    }
    else if (data == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[             
              SpinKitWanderingCubes(color: Colors.blue)
            ],
        )),
      );
    }
    else {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
                 UserAccountsDrawerHeader(
      accountEmail: Text("Akshay@gmail.com"),
      accountName: Text("Akshay Madan"),
      currentAccountPicture: CircleAvatar(
        child: Text("A"),
      ),
       ),
            Padding(padding: EdgeInsets.all(10),),
            Text(' Categories', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, )),
            Padding(padding: EdgeInsets.all(5),),
            Divider(height: 2, thickness: 2,),
            ListTile(
              // leading: Text(''),
              title: Text('Headlines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
              
              onTap: () {
                category('headlines'); 
                Navigator.pop(context);
              }
            ),
            Divider(height: 5, thickness: 1,),
            ListTile(
              title: Text('General', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )),
              
              onTap: () {
                category('general'); 
                Navigator.pop(context);
              }
            ),
            Divider(height: 5, thickness: 1,),
            ListTile(
              title: Text('Business', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )),
              
              onTap: () {
                category('business'); 
                Navigator.pop(context);
              }
            ),
            
            Divider(height: 5, thickness: 1,),
            ListTile(
              title: Text('Sports', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
              
              onTap: () {
                category('sports'); 
                Navigator.pop(context);
              }
            ),
            Divider(height: 5, thickness: 1,),
            ListTile(
              title: Text('Health', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )),
              
              onTap: () {
                category('health'); 
                Navigator.pop(context);
              }
            ),
            Divider(height: 5, thickness: 1,),
            ListTile(
              title: Text('Entertainment', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
             
              onTap: () {
                category('entertainment'); 
                Navigator.pop(context);
              }
            ),
            Divider(height: 5, thickness: 1,),
            ListTile(
              title: Text('Science', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )),
              
              onTap: () {
                category('science'); 
                Navigator.pop(context);
              }
            ),
            Divider(height: 5, thickness: 1,),
            ListTile(
              title: Text('Technology', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )),
              
              onTap: () {
                category('technology'); 
                Navigator.pop(context);
              }
            ),
            Divider(height: 5, thickness: 2,),  
            
                                 
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: noOfNews,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              leading: data['articles'][index]['urlToImage'] == null ? Text('No Image', style: TextStyle(fontSize: 24),) : Image.network(data['articles'][index]['urlToImage'], height: 100, width: 100,),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data['articles'][index]['title']),
                  Text(data['articles'][index]['source']['name'], style: TextStyle(color: Colors.grey, fontSize: 15),),
                  Divider(height: 1, color: Colors.black,),
                ],
              ),
              onTap: (){
                if (data['articles'][index]['content'] != null) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => Article(data['articles'][index], heading))
                  );
                }
              },
            ),
          );
        },
      )
    );}
  }
}