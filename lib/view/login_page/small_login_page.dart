import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/view/login_page/shared_parts/login_part.dart';

class SmallLogInPage extends StatelessWidget {
  const SmallLogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) => SingleChildScrollView(
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
                  LoginPart(),
                  const SizedBox(
                    height: 20,
                  ),
                  _spliter(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      socialMediaLogin(logo: AssetsManager.facebookLogo),
                      const Spacer(),
                      socialMediaLogin(logo: AssetsManager.googleLogo),
                      const Spacer(),
                      socialMediaLogin(logo: AssetsManager.twitterLogo),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget socialMediaLogin({required String logo}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: ColorManager.whiteColor,
        radius: 20,
        backgroundImage: AssetImage(logo),
      ),
    );
  }

  Widget _spliter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: ColorManager.blackColor,
            height: 1.5,
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'OR',
              style: TextStyle(fontSize: 18),
            )),
        Expanded(
          child: Container(
            color: ColorManager.blackColor,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
