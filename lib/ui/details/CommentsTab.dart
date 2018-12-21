import 'package:flutter/material.dart';

import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hacker_newz/model/HNItem.dart';

class CommentsTab extends StatelessWidget {

  CommentsTab({@required this.item});

  final HNItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:

        item.kids.map((int id){
                              return Text(id.toString());
                            }).toList()


        ,
      ),
    );
  }

}

