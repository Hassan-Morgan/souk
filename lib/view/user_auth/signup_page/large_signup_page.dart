import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/default_loading_page.dart';
import 'package:soukapp/view/custom_widgets/shared_social_media_login.dart';
import 'package:soukapp/view/user_auth/signup_page/shared_parts/signup_fields.dart';

class LargeSignUpPage extends StatelessWidget {
  const LargeSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) => Stack(
            children: [
              Row(
                children: [
                  const SocialMediaLoginPart(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Center(
                      child: SingleChildScrollView(
                        child: SignupPart(),
                      ),
                    ),
                  ),
                ],
              ),
              if (controller.loading) const LoadingPage(),
            ],
          ),
        ),
      ),
    );
  }
}
