import 'package:flutter/material.dart';

import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserTab extends StatelessWidget {
  final String url;

  BrowserTab({@required this.url});

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javaScriptMode: JavaScriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),

    );
  }

}

