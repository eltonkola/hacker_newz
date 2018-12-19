import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class BrowserTab extends StatelessWidget {

  final String url;

  BrowserTab({@required this.url});

 @override
 Widget build(BuildContext context) {
   return Container(
     child: new WebviewScaffold(
       url: url,
       appBar: new AppBar(
         title: const Text('Widget webview'),
       ),
       withZoom: true,
       withLocalStorage: true,
       hidden: true,
       initialChild: Container(
         color: Colors.redAccent,
         child: const Center(
           child: Text('Loading.....'),
         ),
       ),
     ),
   );
 }
}