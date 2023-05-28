import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_articles_api/MostSharedPage.dart';
import 'package:simple_articles_api/MostViewedPage.dart';
import 'package:simple_articles_api/PopullarPage.dart';
import 'dart:convert';

import 'Article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              child: Text('Search'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MostViewedPage()),
                );

              },
              child: Text('Most Viewed'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PopularPage()),
                );

              },

              child: Text('Popular'),
            ),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MostSharedPage()),
                );


              },
              child: Text('Most Shared'),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Article> articles = [];
  TextEditingController searchController = TextEditingController();




  Future<void> searchArticles() async {
    String searchTerm = searchController.text;
    String apiUrl = 'https://api.example.com/search?term=$searchTerm';

    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
          List<Article> results = [];
        for (var article in data) {
          //   results.add(Article.fromJson(article));
        }
        setState(() {
          articles = results;
        });
      } else {
        // Handle error
      }
    } catch (exception) {
      // Handle exception
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Page'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  floatingLabelAlignment: FloatingLabelAlignment.start
                ),
              ),
            ),
            ElevatedButton(
              onPressed: searchArticles,
              child: Text('Search',
                textAlign: TextAlign.start),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(articles[index].title.toString()),
                    subtitle: Text(articles[index].author.toString()),
                  );
                },
              ),
            ),
          ],
        )
    );
  }


}