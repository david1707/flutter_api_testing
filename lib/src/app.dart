import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        // home: NewsList(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) {
              return NewsList();
            }
          );
        },
      ),
    );
  }
}