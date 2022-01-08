import 'package:flutter/material.dart';
import 'package:soukapp/view/signup_page/large_signup_page.dart';
import 'package:soukapp/view/signup_page/small_signup_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: constrains.maxWidth < 700
            ? const SmallSignupPage()
            : const LargeSignUpPage(),
      );
    });
  }
}
