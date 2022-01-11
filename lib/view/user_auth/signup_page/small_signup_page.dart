import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/view/custom_widgets/default_loading_page.dart';
import 'package:soukapp/view/user_auth/signup_page/shared_parts/signup_fields.dart';

class SmallSignupPage extends StatelessWidget {
  const SmallSignupPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) => Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        AssetsManager.appIcon,
                        width: 300,
                        height: 150,
                      ),
                      const SizedBox(height: 30),
                      SignupPart(),
                    ],
                  ),
                ),
              ),
            ),
            if (controller.loading)
              const LoadingPage(),
          ],
        ),
      ),
    );
  }
}
