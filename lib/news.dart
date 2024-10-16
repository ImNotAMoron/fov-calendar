import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

class New {
  String title;
  String content;

  New(this.title, this.content);
}

class News extends StatefulWidget {
  final List<New> news = [];
  final bool isNewsFetched = false;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final firebaseApp = Firebase.app();
  List<New> news = [];
  bool isNewsFetched = false;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("");

  @override
  void initState() {
    news = widget.news;
    isNewsFetched = widget.isNewsFetched;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final newsTitle = theme.textTheme.titleLarge;
    final newsContent = theme.textTheme.bodyMedium;
    if (!isNewsFetched) {
      final rtdb = FirebaseDatabase.instanceFor(
          app: firebaseApp,
          databaseURL:
              'https://fov-calendar-3bc2d-default-rtdb.europe-west1.firebasedatabase.app/');
      DatabaseReference ref = rtdb.ref("");
      ref.child('news').get().then((snapshot) {
        if (snapshot.exists && snapshot.value != null) {
          List<New> newNews = [];
          for (final el in snapshot.value as List) {
            if (el != null &&
                el["title"] != null &&
                el["description"] != null) {
              newNews.add(New(el["title"], el["description"]));
            }
          }
          setState(() {
            isNewsFetched = true;
            news = newNews;
          });
        } else {
          print('No data available.');
        }
      });
    }

    print("Rebuilding news");
    // TODO: implement buil
    List<Widget> widgets = [];
    for (New nw in news.reversed) {
      widgets.add(SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: theme.colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                nw.title,
                style: newsTitle,
              ),
              const SizedBox(
                height: 5,
              ),
              Linkify(
                onOpen: (LinkableElement link) async {
                  await launchUrlString(link.url);
                },
                text: nw.content,
                style: newsContent,
              )
            ]),
          ),
        ),
      ));
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(children: widgets),
            )
          ],
        ),
      ),
    );
  }
}
