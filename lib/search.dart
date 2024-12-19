import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/news/news_item.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppTheme.primary,
          foregroundColor: AppTheme.white,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
          actionsIconTheme: IconThemeData(color: AppTheme.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: AppTheme.white,
                fontSize: 14,
                fontWeight: FontWeight.w400)));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query = '';
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: ApIService.getQuery(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final results = snapshot.data!;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final news = results[index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      NewsItem(news),
                    ],
                  );
                },
              ),
            ),
          );
        } else {
          return const Center(child: Text('No results found.'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            query.isEmpty ? 'Enter a search term' : 'Searching for "$query"...',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
