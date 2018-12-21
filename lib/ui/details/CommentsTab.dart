import 'package:flutter/material.dart';

import 'package:hacker_newz/model/HNItem.dart';
import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/ui/details/CommentView.dart';

class CommentsTab extends StatelessWidget {

  CommentsTab({@required this.apiService, @required this.item});

  final HNItem item;
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: new ListView.builder(
        itemCount: item.kids.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new CommentView(apiService, item.kids[index], 0);
        },
      )

    );
  }

}
