import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Website extends StatefulWidget {
  static const routeName = '/website';

  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  String link = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final linkInfo =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    link = linkInfo['link'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heart')),
      body: WebView(
        initialUrl: link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
