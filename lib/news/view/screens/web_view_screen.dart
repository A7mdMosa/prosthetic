import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../home/view/widgets/app_title_app_bar.dart';


class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitleAppBar(
          title: 'news',
          textColor: Colors.black,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
          child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      )),
    );
  }
}
