import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:progetto_8_hackernews/models/story_model.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<StoryModel>> storyModelFuture;

  @override
  void initState() {
    storyModelFuture = downloadStoryData();

    super.initState();
  }

  Future<List<StoryModel>> downloadStoryData() async {
    final topStoriesHttpRequest = await http.get(Uri.parse(
        "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"));

    final topStoriesIds =
        jsonDecode(topStoriesHttpRequest.body) as List<dynamic>;

    final topStoriesFuture = topStoriesIds.take(10).map((responseIds) async {
      final response = await http.get(Uri.parse(
          "https://hacker-news.firebaseio.com/v0/item/$responseIds.json?print=pretty"));

      final storyData = jsonDecode(response.body);

      return StoryModel.FormData(storyData);
    }).toList();

    final finalTopStories = await Future.wait(topStoriesFuture);
    return finalTopStories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HackerNews"),
        backgroundColor: Colors.orange,
      ),
      body: body(),
    );
  }

  Widget body() => FutureBuilder<List<StoryModel>>(
      future: storyModelFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return CircularProgressIndicator();
        } else {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                snapshot.data![index].title,
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(snapshot.data![index].author),
            ),
            separatorBuilder: (context, index) => Divider(),
          );
        }
      });
}
