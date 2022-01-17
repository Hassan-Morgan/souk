

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soukapp/view/user_auth/login_page/small_login_page.dart';

import 'large_login_page.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return kIsWeb ? const LargeLogInPage():const SmallLogInPage();
    });
  }
}
