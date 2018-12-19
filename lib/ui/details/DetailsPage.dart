import 'package:hacker_newz/model/HNItem.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hacker_newz/ui/details/BrowserTab.dart';

class DetailsPage extends StatelessWidget {

  DetailsPage({@required this.item});

  final HNItem item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item.title,
          style: textTheme.headline,
        ),
        Text(
          item.url,
          style: textTheme.subhead,
        ),
      ],
    );

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
              content,
              new BrowserTab(url: item.url),
              content,
            ],
          ),
        ),
      ),
      ),
    );
  }

}