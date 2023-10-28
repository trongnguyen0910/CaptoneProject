import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  const NewsWebView({super.key});

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        'https://nongsanviet.nongnghiep.vn/nong-san-viet-nong-nghiep-40/'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 135, 54),
        actions: [
          IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () async {
            if (await controller.canGoForward()) {
              await controller.goForward();
            }
          },
        ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            if (await controller.canGoBack()) {
              await controller.goBack();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text("  Tin tức nông sản Việt Nam"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
