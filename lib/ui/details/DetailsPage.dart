import 'package:hacker_newz/model/HNItem.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hacker_newz/ui/details/BrowserTab.dart';
import 'package:hacker_newz/ui/details/CommentsTab.dart';
import 'package:hacker_newz/ui/details/ReaderTab.dart';

class DetailsPage extends StatelessWidget {

  DetailsPage({@required this.item});

  final HNItem item;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs:[
                Tab(text: "Comments"),
                Tab(text: "Article"),
                Tab(text: "Read mode")
              ]
              ,
            ),
            title: Text(item.title),
          ),
          body: TabBarView(
            children: [
              new CommentsTab(item:item),
              new BrowserTab(url: item.url),
              new ReaderTab(item:item),
            ],
          ),
        ),
      ),
      ),
    );
  }

}