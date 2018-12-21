import 'package:flutter/material.dart';

import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hacker_newz/model/HNItem.dart';

class ReaderTab extends StatelessWidget {

  ReaderTab({@required this.item});

  final HNItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title,
          ),
          Text(
            item.text,
          ),
        ],
      ),
    );
  }

}

