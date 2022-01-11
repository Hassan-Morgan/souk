

import 'package:flutter/material.dart';
import 'package:soukapp/view/user_auth/login_page/small_login_page.dart';

import 'large_login_page.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return constrains.maxWidth<600? const SmallLogInPage():const LargeLogInPage();
    });
  }
}
