import 'package:flutter/material.dart';
import 'package:soukapp/view/login_page/large_login_page.dart';
import 'package:soukapp/view/login_page/small_login_page.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: constrains.maxWidth<700? const SmallLogInPage():const LargeLogInPage(),
      );
    });
  }
}
