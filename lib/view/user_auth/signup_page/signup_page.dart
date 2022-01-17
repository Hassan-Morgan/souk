import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soukapp/view/user_auth/signup_page/small_signup_page.dart';

import 'large_signup_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return kIsWeb
          ? const LargeSignUpPage()
          :const SmallSignupPage();
    });
  }
}
