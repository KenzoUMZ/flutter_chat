import 'package:flutter/material.dart';
import 'package:flutter_chat/components/appbar/chat_appbar.dart';
import 'package:flutter_chat/pages/chat/chat_page.dart';
import 'package:flutter_chat/pages/home/home_page.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  late String title = 'Comunidade';
  late bool showBackButton = true;
  late Widget? icon = const Icon(
    Icons.chat_bubble,
    size: 15,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        title: title,
        showBackButton: showBackButton,
        icon: icon,
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int page) {
          setState(() {
            if (page == 0) {
              title = 'Voltar';
              showBackButton = true;
              icon = null;
            } else if (page == 1) {
              title = 'Comunidade';
              showBackButton = true;
              icon = const Icon(
                Icons.chat_bubble,
                size: 15,
                color: Colors.white,
              );
            }
          });
        },
        children: const [
          HomePage(),
          ChatPage(),
        ],
      ),
    );
  }
}
